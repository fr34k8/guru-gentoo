# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Library for interfacing a game with a locally running Discord desktop client"
HOMEPAGE="https://github.com/discord/discord-rpc"
SRC_URI="https://github.com/discord/discord-rpc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND="
	dev-libs/rapidjson
"

PATCHES=(
	"${FILESDIR}/${PN}-3.4.0-install-examples-for-RelWithDebInfo-too.patch"
)

src_configure() {
	local mycmakeargs=(
		-DBUILD_EXAMPLES=$(usex examples)
	)

	cmake_src_configure
}
