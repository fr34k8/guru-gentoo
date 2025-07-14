# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="Set of libraries for building Wayland based shells"
HOMEPAGE="https://mir-server.io/"
SRC_URI="https://github.com/canonical/mir/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-2 GPL-3 ) || ( LGPL-2.1 LGPL-3 )"
SLOT="0/${PV}"
KEYWORDS="~amd64"
IUSE="test X"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-cpp/glibmm:2
	dev-cpp/libxmlpp:2.6
	dev-cpp/yaml-cpp:=
	dev-libs/boost:=
	dev-libs/glib:2
	dev-libs/libinput:=
	dev-libs/wayland
	dev-util/lttng-ust:=
	media-libs/freetype
	media-libs/libepoxy
	media-libs/libglvnd
	media-libs/mesa
	sys-apps/util-linux
	x11-libs/libXcursor
	x11-libs/libdrm
	x11-libs/libxcb:=
	x11-libs/libxkbcommon
	x11-libs/pixman
	virtual/libudev:=
	X? ( x11-libs/libX11 )
"
DEPEND="
	${RDEPEND}
	media-libs/glm
"
BDEPEND="
	dev-util/gdbus-codegen
	virtual/pkgconfig
	test? (
		dev-cpp/gtest
		dev-util/umockdev
		x11-base/xwayland
	)
"

PATCHES=(
	# bug 932786
	"${FILESDIR}/${PN}-2.17.0-remove-debug-flags.patch"
	"${FILESDIR}/${PN}-2.20.0-remove-tests.patch"
)

src_prepare() {
	cmake_src_prepare
	cmake_comment_add_subdirectory examples/ examples/tests/
}

src_configure() {
	local platforms="gbm-kms;atomic-kms;wayland"
	use X && platforms="${platforms};x11"

	local mycmakeargs=(
		# wlcs is not packaged
		-DMIR_ENABLE_WLCS_TESTS=OFF
		-DMIR_ENABLE_TESTS="$(usex test)"
		-DMIR_FATAL_COMPILE_WARNINGS=OFF
		-DMIR_PLATFORM="${platforms}"
	)
	use test && mycmakeargs+=(
		# likely will not work in build environment
		-DMIR_BUILD_PERFORMANCE_TESTS=OFF
		-DMIR_BUILD_PLATFORM_TEST_HARNESS=OFF
		-DMIR_BUILD_UNIT_TESTS=OFF
	)
	cmake_src_configure
}
