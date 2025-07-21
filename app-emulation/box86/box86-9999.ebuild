# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake optfeature toolchain-funcs flag-o-matic git-r3

DESCRIPTION="Linux Userspace x86 Emulator with a twist"
HOMEPAGE="https://box86.org"
EGIT_REPO_URI="https://github.com/ptitSeb/${PN}"

LICENSE="MIT"
SLOT="0"
IUSE="aot"
REQUIRED_USE="aot? ( || ( arm arm64 ) )" #depends on NEON, VFPv3, and non-thumb ABI, I see no good way to check

pkg_setup() {
	if [[ ${CHOST} == *64* ]]; then
		ewarn ""
		ewarn "box86 relies on a toolchain capable of emitting 32-bit code, and a 32 bit libc."
		ewarn "If you're on a non multilib 64-bit profile, you will need to add multilib capabilities to it, see:"
		ewarn "https://wiki.gentoo.org/wiki/User:Aslantis/Multilib_on_targets_without_official_multilib_profiles"
		ewarn\
		"Alternatively, box64 may work on your system, and can be used in tandem with wine's WOW64 for windows programs."
		ewarn "box86 also doesn't support being built for the thumb ABI"
		ewarn "If you have a thumb system you'll need -marm in your *FLAGS"
		ewarn ""
	fi

	if [[ $(tc-endian) == big ]]; then
		eerror "box86/box64 sadly does not support big endian systems."
		die "big endian not supported!"
	fi

	if [[ ${CHOST} != *linux* ]]; then
		eerror "box86/64 requires a linux system."
		die "Not a GNU+Linux system"
	fi

	if [[ ${CHOST} != *gnu* ]]; then #in case musl support is added in master branch
		ewarn ""
		ewarn "box86/64 will likely not build or run on a non-glibc system."
		ewarn ""
	fi
}

src_configure() {
	local -a mycmakeargs=(
		-DNOGIT=0
		-DARM_DYNAREC=0
	)

	(use amd64 || use x86) && mycmakeargs+=( -DLD80BITS=1 -DNOALIGN=1 )
	(use arm64 || use arm) && mycmakeargs+=( -DARM_DYNAREC=$(usex aot) )

	append-flags "-m32"

	cmake_src_configure
}

pkg_postinst() {
	optfeature "OpenGL for GLES devices" \
		"media-libs/gl4es"
}
