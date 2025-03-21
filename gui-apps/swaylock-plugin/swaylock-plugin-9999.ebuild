# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit fcaps meson

if [[ "${PV}" == 9999 ]]
then
	  inherit git-r3
	  EGIT_REPO_URI="https://github.com/mstoeckl/${PN}.git"
else
	SRC_URI="https://github.com/mstoeckl/swaylock-plugin/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Fork of Swaylock that supports animated backgrounds"
HOMEPAGE="https://github.com/mstoeckl/swaylock-plugin"
LICENSE="MIT"
SLOT="0"
IUSE="+gdk-pixbuf +man +pam"

DEPEND="
	dev-libs/wayland
	x11-libs/cairo
	x11-libs/libxkbcommon
	virtual/libcrypt:=
	gdk-pixbuf? ( x11-libs/gdk-pixbuf:2 )
	pam? ( sys-libs/pam )

"
RDEPEND="
	dev-libs/glib:2
	${DEPEND}"
BDEPEND="
	>=dev-libs/wayland-protocols-1.25
	>=dev-util/wayland-scanner-1.15
	virtual/pkgconfig
	man? ( app-text/scdoc )
"

src_configure() {
	local emesonargs=(
		-Dman-pages=$(usex man enabled disabled)
		-Dpam=$(usex pam enabled disabled)
		-Dgdk-pixbuf=$(usex gdk-pixbuf enabled disabled)
		"-Dfish-completions=true"
		"-Dzsh-completions=true"
		"-Dbash-completions=true"
	)

	meson_src_configure
}

pkg_postinst() {
	if ! use pam; then
		  fcaps cap_sys_admin usr/bin/swaylock
	fi
}
