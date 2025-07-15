# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
COMMIT="d3073ef124172a6161e3bef075aaa8112b0115e9"

inherit meson

DESCRIPTION="A Wayland Native VNC Client"
HOMEPAGE="https://github.com/any1/wlvncc"
SRC_URI="https://github.com/any1/wlvncc/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/lzo
	dev-libs/wayland-protocols
	x11-libs/libdrm
"
RDEPEND="
	dev-libs/aml
	x11-libs/libxkbcommon
	x11-libs/pixman
	dev-libs/wayland
"
