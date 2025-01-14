# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( {16..19} )
RUST_MIN_VER="1.80.0"

# used for version string
export NIRI_BUILD_COMMIT="e05bc26"

inherit cargo llvm-r2 systemd

DESCRIPTION="Scrollable-tiling Wayland compositor"
HOMEPAGE="https://github.com/YaLTeR/niri"
SRC_URI="
	https://github.com/YaLTeR/niri/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/YaLTeR/niri/releases/download/v${PV}/${P}-vendored-dependencies.tar.xz
"

LICENSE="GPL-3+"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD ISC MIT MPL-2.0
	Unicode-3.0 Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+dbus screencast systemd"
REQUIRED_USE="
	screencast? ( dbus )
	systemd? ( dbus )
"

DEPEND="
	dev-libs/glib:2
	dev-libs/libinput:=
	dev-libs/wayland
	media-libs/libdisplay-info:=
	media-libs/mesa
	sys-auth/seatd:=
	virtual/libudev:=
	x11-libs/cairo
	x11-libs/libxkbcommon
	x11-libs/pango
	x11-libs/pixman
	screencast? (
		media-video/pipewire:=
	)
"
RDEPEND="${DEPEND}"
# libclang is required for bindgen
BDEPEND="
	screencast? ( $(llvm_gen_dep 'llvm-core/clang:${LLVM_SLOT}') )
"

ECARGO_VENDOR="${WORKDIR}/vendor"

QA_FLAGS_IGNORED="usr/bin/niri"

pkg_setup() {
	llvm-r2_pkg_setup
	rust_pkg_setup
}

src_prepare() {
	sed -i 's/git = "[^ ]*"/version = "*"/' Cargo.toml || die
	default
}

src_configure() {
	local myfeatures=(
		$(usev dbus)
		$(usev screencast xdp-gnome-screencast)
		$(usev systemd)
	)
	cargo_src_configure --no-default-features
}

src_install() {
	cargo_src_install

	dobin resources/niri-session
	systemd_douserunit resources/niri{.service,-shutdown.target}

	insinto /usr/share/wayland-sessions
	doins resources/niri.desktop

	insinto /usr/share/xdg-desktop-portal
	doins resources/niri-portals.conf
}

src_test() {
	# tests create a wayland socket in the xdg runtime dir
	export XDG_RUNTIME_DIR="${T}/xdg"
	mkdir "${XDG_RUNTIME_DIR}" || die
	chmod 0700 "${XDG_RUNTIME_DIR}" || die

	# tests might fail when executed in parallel
	# https://github.com/YaLTeR/niri/issues/953
	export RAYON_NUM_THREADS=1

	cargo_src_test
}