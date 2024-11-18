# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=8

inherit cmake

DESCRIPTION="An application to enable a blue-light filter on Hyprland"
HOMEPAGE="https://github.com/hyprwm/hyprsunset"
SRC_URI="https://github.com/hyprwm/hyprsunset/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	gui-wm/hyprland:=
	dev-libs/wayland
	>=dev-libs/hyprland-protocols-0.4.0
"
DEPEND="
	${RDEPEND}
	dev-util/wayland-scanner
	>=gui-libs/hyprutils-0.2.3
	>=dev-util/hyprwayland-scanner-0.4.0
	virtual/pkgconfig
"
