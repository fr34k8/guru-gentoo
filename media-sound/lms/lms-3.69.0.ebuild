# Copyright 2024-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake pam systemd

DESCRIPTION="Lightweight Music Server."
HOMEPAGE="https://lms-demo.poupon.dev/ https://github.com/epoupon/lms"
SRC_URI="https://github.com/epoupon/lms/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test +stb"
RESTRICT="!test? ( test )"

RDEPEND="
	app-arch/libarchive
	acct-user/lms
	dev-cpp/wt:=
	dev-libs/boost:=
	dev-libs/libconfig[cxx]
	media-libs/taglib:=
	media-video/ffmpeg[lame,opus]
	sys-libs/pam

	!stb? ( media-gfx/graphicsmagick )

"

DEPEND="
	${RDEPEND}
	dev-libs/xxhash
	stb? ( dev-libs/stb )
"

BDEPEND="
	test? ( dev-cpp/gtest )
"

src_configure() {
	local mycmakeargs=(
		-DLMS_IMAGE_BACKEND=$(usex stb stb graphicsmagick)
		-DENABLE_TESTS=$(usex test)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	systemd_newunit conf/systemd/default.service lms.service
	newinitd "${FILESDIR}/lms.init" lms
	dopamd conf/pam/lms
	mv "${ED}/usr/share/lms/lms.conf" "${ED}/etc/lms.conf" || die

	# Already installed in the proper directory
	rm "${ED}/usr/share/lms/default.service" || die
	rm "${ED}/usr/share/lms/lms" || die

	keepdir /var/log/lms
	fowners -R lms:lms /var/log/lms

	keepdir /var/lms
	fowners lms:lms /var/lms
}
