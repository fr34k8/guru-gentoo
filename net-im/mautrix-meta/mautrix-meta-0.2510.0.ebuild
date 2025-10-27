# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="A Matrix-Facebook puppeting bridge"
HOMEPAGE="https://github.com/mautrix/meta"
SRC_URI="https://github.com/mautrix/meta/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://jroy.ca/dist/${P}-deps.tar.xz
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	acct-user/${PN}
	dev-libs/olm
"
DEPEND="${RDEPEND}"

src_compile() {
	MAUTRIX_VERSION=$(cat go.mod | grep 'maunium.net/go/mautrix ' | awk '{ print $2 }')
	GO_LDFLAGS="-s -w -X main.Tag=$(git describe --exact-match --tags 2>/dev/null) -X main.Commit=$(git rev-parse HEAD) -X 'main.BuildTime=`date '+%b %_d %Y, %H:%M:%S'`' -X 'maunium.net/go/mautrix.GoModVersion=$MAUTRIX_VERSION'"
	ego build -ldflags "$GO_LDFLAGS" "${S}"/cmd/"${PN}"
}

src_install() {
	dobin mautrix-meta

	keepdir /var/log/mautrix/meta
	fowners -R root:mautrix /var/log/mautrix
	fperms -R 770 /var/log/mautrix

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"

	keepdir /etc/mautrix
	fowners -R root:mautrix /etc/mautrix
	fperms -R 770 /etc/mautrix
}

pkg_postinst() {
	einfo
	elog ""
	elog "Before you can use ${PN}, you must configure it correctly"
	elog "To generate the configuration file, use the following command:"
	elog "mautrix-signal -e"
	elog "Then move the config.yaml file to /etc/mautrix/${PN/-/_}.yaml"
	elog "Configure the file according to your homeserver"
	elog "When done, run the following command: emerge --config ${CATEGORY}/${PN}"
	elog "Then, you must register the bridge with your homeserver"
	elog "Refer your homeserver's documentation for instructions"
	elog "The registration file is located at /var/lib/${PN/-/\/}/registration.yaml"
	elog "Finally, you may start the ${PN} daemon"
	einfo
}
pkg_config() {
	su - "${PN}" -s /bin/sh -c \
		"/usr/bin/${PN} -c /etc/mautrix/${PN/-/_}.yaml -g -r /var/lib/${PN/-/\/}/registration.yaml"
}
