# Copyright 2019-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg ninja-utils

if [[ "${PV}" == "9999" ]]
then
	EGIT_REPO_URI="https://hacktivis.me/git/badwolf.git"
	inherit git-r3
else
	VERIFY_SIG_METHOD=signify
	inherit savedconfig verify-sig

	MY_P="${PN}-$(ver_rs 3 - 4 .)"
	SRC_URI="
		https://distfiles.hacktivis.me/releases/badwolf/${MY_P}.tar.gz
		verify-sig? ( https://distfiles.hacktivis.me/releases/badwolf/${MY_P}.tar.gz.sign )
	"
	KEYWORDS="~amd64 ~arm64 ~ppc64"
	S="${WORKDIR}/${MY_P}"
fi

DESCRIPTION="Minimalist and privacy-oriented WebKitGTK+ browser"
HOMEPAGE="https://hacktivis.me/projects/badwolf"
LICENSE="BSD"
SLOT="0"

DOCS=("README.md" "KnowledgeBase.md")

IUSE="test"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/glib
	dev-libs/libxml2
	x11-libs/gtk+:3
	net-libs/webkit-gtk:4.1=
"
RDEPEND="${DEPEND}"
BDEPEND="test? ( app-text/mandoc )"

PATCHES=(
	"${FILESDIR}/badwolf-1.4.0-configure-rename-ED-variable-to-CMD_ED.patch"
)

if [[ "${PV}" != "9999" ]]
then
	BDEPEND="${BDEPEND} verify-sig? ( sec-keys/signify-keys-lanodan:2025 )"

	VERIFY_SIG_OPENPGP_KEY_PATH="/usr/share/signify-keys/signify-keys-lanodan-2025.pub"

	src_unpack() {
		if use verify-sig; then
			# Too many levels of symbolic links
			cd "${DISTDIR}" || die
			cp ${A} "${WORKDIR}" || die
			cd "${WORKDIR}" || die
			verify-sig_verify_detached "${MY_P}.tar.gz" "${MY_P}.tar.gz.sign"
		fi
		default
	}
fi

src_configure() {
	[[ "${PV}" == "9999" ]] || restore_config config.h

	CC="${CC:-cc}" \
	CMD_ED="false" \
	CFLAGS="${CFLAGS:--02 -Wall -Wextra}" \
	LDFLAGS="${LDFLAGS}" \
	DOCDIR="/usr/share/doc/${PF}" \
	WITH_WEBKITGTK="4.1" \
	PREFIX="/usr" \
	./configure
}

src_compile() {
	eninja
}

src_test() {
	eninja test
}

src_install() {
	DESTDIR="${ED}" eninja install

	[[ "${PV}" == "9999" ]] || save_config config.h
}
