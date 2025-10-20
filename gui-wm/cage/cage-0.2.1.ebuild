# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="A Wayland kiosk"
HOMEPAGE="https://www.hjdskes.nl/projects/cage/ https://github.com/cage-kiosk/cage"

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/cage-kiosk/cage"
else
	SRC_URI="https://github.com/cage-kiosk/cage/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="X man"

RDEPEND="
	dev-libs/wayland
	gui-libs/wlroots:0.19
	x11-libs/libxkbcommon[X?]
	X? ( gui-libs/wlroots:0.19[X,x11-backend] )
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_feature man man-pages)
	)
	meson_src_configure
}
