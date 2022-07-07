# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

KFMIN=5.91.0
QTMIN=5.15.0
inherit ecm virtualx

DESCRIPTION="Convergent visual components for Kirigami-based applications"
HOMEPAGE="https://invent.kde.org/libraries/kirigami-addons"
SRC_URI="mirror://kde/unstable/${PN}/${PV}/${P}.tar.xz"

LICENSE="|| ( GPL-2 GPL-3 LGPL-3 ) LGPL-2+ LGPL-2.1+"
SLOT="5"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kirigami-${KFMIN}:5
"
RDEPEND="${DEPEND}"

src_test() {
	virtx ecm_src_test
}
