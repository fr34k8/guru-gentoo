# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CHROMIUM_LANGS="af am ar bg bn ca cs da de el en-GB en-US es-419 es et fa fil fi fr gu he hi hr hu id it
ja kn ko lt lv ml mr ms nb nl pl pt-BR pt-PT ro ru sk sl sr sv sw ta te th tr uk ur vi zh-CN zh-TW"

inherit desktop xdg unpacker chromium-2

DESCRIPTION="Desktop application for Jitsi Meet built with Electron"
HOMEPAGE="https://github.com/jitsi/jitsi-meet-electron"
SRC_URI="https://github.com/jitsi/jitsi-meet-electron/releases/download/v${PV}/jitsi-meet-amd64.deb -> ${P}.deb"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="bindist mirror splitdebug test"

#Depends: libgtk-3-0, libnss3, libxtst6, xdg-utils, libatspi2.0-0, libuuid1
#	sys-libs/libuuid seems to be included in sys-apps/util-linux
#	sys-fs/fuse
RDEPEND="
	x11-libs/gtk+:3
	dev-libs/nss
	x11-libs/libXtst
	app-accessibility/at-spi2-core:2
"

QA_PREBUILT="*"

src_install() {
	rm "opt/Jitsi Meet/chrome-sandbox" || die
	rm "opt/Jitsi Meet/resources/app.asar.unpacked/node_modules/@jitsi/robotjs/prebuilds/linux-arm64/@jitsi+robotjs.node" || die

	insinto /opt
	doins -r "opt/Jitsi Meet"

	dobin "opt/Jitsi Meet/jitsi-meet"
	dosym "../../opt/Jitsi Meet/jitsi-meet" /usr/bin/jitsi-meet
	domenu usr/share/applications/jitsi-meet.desktop
	doicon usr/share/icons/hicolor/512x512/apps/jitsi-meet.png

	pushd "${ED}/opt/Jitsi Meet/locales" > /dev/null || die
	chromium_remove_language_paks
	popd > /dev/null || die

	fperms +x "/opt/Jitsi Meet/jitsi-meet"
}
