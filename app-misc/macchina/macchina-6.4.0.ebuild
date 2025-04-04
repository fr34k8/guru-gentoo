# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.4

EAPI=8

CRATES="
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	ansi-to-tui@7.0.0
	anstream@0.6.15
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anstyle@1.0.8
	anyhow@1.0.89
	atty@0.2.14
	autocfg@1.3.0
	bitflags@1.3.2
	bitflags@2.6.0
	block@0.1.6
	bumpalo@3.16.0
	byteorder@1.5.0
	bytesize@1.3.0
	camino@1.1.9
	cargo-platform@0.1.8
	cargo_metadata@0.18.1
	cassowary@0.3.0
	castaway@0.2.3
	cc@1.1.19
	cfg-if@0.1.10
	cfg-if@1.0.0
	chrono@0.4.38
	clap@4.5.17
	clap_builder@4.5.17
	clap_derive@4.5.13
	clap_lex@0.7.2
	cocoa@0.20.2
	colorchoice@1.0.2
	colored@2.1.0
	compact_str@0.8.0
	core-foundation-sys@0.7.0
	core-foundation-sys@0.8.7
	core-foundation@0.7.0
	core-foundation@0.9.4
	core-graphics-types@0.1.3
	core-graphics@0.19.2
	core-graphics@0.23.2
	core-video-sys@0.1.4
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	deranged@0.3.11
	dirs-sys@0.4.1
	dirs@5.0.1
	dlib@0.5.2
	either@1.13.0
	enum-as-inner@0.6.1
	equivalent@1.0.1
	errno@0.3.9
	foreign-types-macros@0.2.3
	foreign-types-shared@0.1.1
	foreign-types-shared@0.3.1
	foreign-types@0.3.2
	foreign-types@0.5.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	gethostname@0.3.0
	getrandom@0.2.15
	hashbrown@0.14.5
	heck@0.5.0
	hermit-abi@0.1.19
	hermit-abi@0.3.9
	home@0.5.9
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	if-addrs@0.10.2
	indexmap@2.5.0
	indoc@2.0.5
	instability@0.3.2
	is_terminal_polyfill@1.70.1
	itertools@0.11.0
	itertools@0.13.0
	itoa@1.0.11
	js-sys@0.3.70
	lazy_static@1.5.0
	libc@0.2.158
	libloading@0.8.5
	libmacchina@8.0.0
	libredox@0.1.3
	linux-raw-sys@0.4.14
	local-ip-address@0.5.7
	lock_api@0.4.12
	log@0.4.22
	lru@0.12.4
	mach2@0.4.2
	malloc_buf@0.0.6
	memchr@2.7.4
	memoffset@0.7.1
	metal@0.18.0
	minimal-lexical@0.2.1
	mio@1.0.2
	neli-proc-macros@0.1.3
	neli@0.6.4
	nix@0.26.4
	nom@7.1.3
	num-conv@0.1.0
	num-traits@0.2.19
	num_cpus@1.16.0
	num_threads@0.1.7
	objc@0.2.7
	objc_exception@0.1.2
	once_cell@1.20.0
	option-ext@0.2.0
	os-release@0.1.0
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	pciid-parser@0.6.3
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pkg-config@0.3.30
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	proc-macro2@1.0.86
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ratatui@0.29.0
	redox_syscall@0.5.4
	redox_users@0.4.6
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.6
	rpm-pkg-count@0.2.1
	rustc_version@0.4.1
	rustix@0.38.37
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.23
	serde@1.0.210
	serde_derive@1.0.210
	serde_json@1.0.128
	serde_spanned@0.6.7
	shellexpand@3.1.0
	shlex@1.3.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simdutf8@0.1.4
	slab@0.4.9
	smallvec@1.13.2
	sqlite3-src@0.6.1
	sqlite3-sys@0.17.0
	sqlite@0.36.1
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	syn@1.0.109
	syn@2.0.77
	sysctl@0.5.5
	thiserror-impl@1.0.63
	thiserror@1.0.63
	time-core@0.1.2
	time-macros@0.2.18
	time@0.3.36
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.20
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing@0.1.40
	unicode-ident@1.0.13
	unicode-segmentation@1.12.0
	unicode-truncate@1.1.0
	unicode-width@0.1.13
	unicode-width@0.2.0
	utf8parse@0.2.2
	vergen@8.3.2
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen@0.2.93
	wayland-sys@0.31.5
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-wsapoll@0.1.2
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-implement@0.48.0
	windows-interface@0.48.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.39.0
	windows@0.48.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.39.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.39.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.39.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.39.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.39.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.18
	winreg@0.10.1
	wmi@0.12.2
	x11rb-protocol@0.12.0
	x11rb@0.12.0
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
"

inherit cargo xdg

DESCRIPTION="A system information fetcher with an emphasis on performance."
HOMEPAGE="https://github.com/Macchina-CLI/macchina"
SRC_URI="
	https://github.com/Macchina-CLI/macchina/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD GPL-3 ISC MIT MPL-2.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-db/sqlite:3"
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/macchina"

src_install() {
	cargo_src_install

	doman doc/macchina.{1,7}

	insinto /usr/share/macchina
	doins -r contrib/themes
}
