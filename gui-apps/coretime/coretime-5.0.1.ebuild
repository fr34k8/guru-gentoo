# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="Time related task manager for C Suite"
HOMEPAGE="https://gitlab.com/cubocore/coreapps/coretime"
SRC_URI="https://gitlab.com/cubocore/coreapps/coretime/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"
S="${WORKDIR}/${PN}-v${PV}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtbase:6[gui,network,widgets]
	dev-qt/qtmultimedia:6
	>=gui-libs/libcprime-5.0.0
"
RDEPEND="${DEPEND}"
