# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.5

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anstyle@1.0.10
	anyhow@1.0.95
	arc-swap@1.7.1
	argfile@0.2.1
	arrayref@0.3.9
	arrayvec@0.7.6
	async-broadcast@0.7.2
	async-channel@2.3.1
	async-executor@1.13.1
	async-fs@2.1.2
	async-io@2.4.0
	async-lock@3.4.0
	async-priority-channel@0.2.0
	async-process@2.3.0
	async-recursion@1.1.1
	async-signal@0.2.10
	async-stream-impl@0.3.6
	async-stream@0.3.6
	async-task@4.7.1
	async-trait@0.1.85
	atomic-take@1.1.0
	atomic-waker@1.1.2
	autocfg@1.4.0
	axum-core@0.4.5
	axum@0.7.9
	backtrace-ext@0.2.1
	backtrace@0.3.74
	base64@0.21.7
	base64@0.22.1
	bitflags@1.3.2
	bitflags@2.7.0
	blake3@1.5.5
	block-buffer@0.10.4
	block@0.1.6
	blocking@1.6.1
	boxcar@0.2.8
	bstr@1.11.3
	bumpalo@3.16.0
	byteorder@1.5.0
	bytes@1.9.0
	c-gull@0.21.0
	c-scape@0.21.0
	cc@1.2.9
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.39
	clap@4.5.28
	clap_builder@4.5.27
	clap_complete@4.5.42
	clap_complete_nushell@4.5.5
	clap_derive@4.5.28
	clap_lex@0.7.4
	clap_mangen@0.2.26
	clearscreen@4.0.1
	clru@0.6.2
	colorchoice@1.0.3
	concurrent-queue@2.5.0
	console-api@0.8.1
	console-subscriber@0.4.1
	constant_time_eq@0.3.1
	core-foundation-sys@0.8.7
	cpufeatures@0.2.16
	crc32fast@1.4.2
	crossbeam-channel@0.5.14
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crypto-common@0.1.6
	cstr_core@0.2.6
	cty@0.2.2
	dashmap@6.1.0
	deranged@0.3.11
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dirs-sys@0.4.1
	dirs@5.0.1
	displaydoc@0.2.5
	dunce@1.0.5
	dyn-clone@1.0.17
	either@1.13.0
	embed-resource@3.0.1
	endi@1.1.0
	endian-type@0.1.2
	enumflags2@0.7.10
	enumflags2_derive@0.7.10
	env_filter@0.1.3
	env_home@0.1.0
	env_logger@0.11.6
	equivalent@1.0.1
	errno@0.3.10
	event-listener-strategy@0.5.3
	event-listener@4.0.3
	event-listener@5.4.0
	eyra@0.20.0
	faster-hex@0.9.0
	fastrand@2.3.0
	filetime@0.2.25
	flate2@1.0.35
	fnv@1.0.7
	foldhash@0.1.4
	form_urlencoded@1.2.1
	fs-err@2.11.0
	fsevent-sys@4.1.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-lite@2.6.0
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	generic-array@0.14.7
	getrandom@0.2.15
	gimli@0.31.1
	gix-actor@0.33.1
	gix-bitmap@0.2.13
	gix-chunk@0.4.10
	gix-command@0.4.0
	gix-commitgraph@0.25.1
	gix-config-value@0.14.10
	gix-config@0.42.0
	gix-date@0.9.3
	gix-diff@0.49.0
	gix-discover@0.37.0
	gix-features@0.39.1
	gix-fs@0.12.1
	gix-glob@0.17.1
	gix-hash@0.15.1
	gix-hashtable@0.6.0
	gix-index@0.37.0
	gix-lock@15.0.1
	gix-object@0.46.1
	gix-odb@0.66.0
	gix-pack@0.56.0
	gix-packetline@0.18.2
	gix-path@0.10.13
	gix-protocol@0.47.0
	gix-quote@0.4.14
	gix-ref@0.49.1
	gix-refspec@0.27.0
	gix-revision@0.31.1
	gix-revwalk@0.17.0
	gix-sec@0.10.10
	gix-shallow@0.1.0
	gix-tempfile@15.0.0
	gix-trace@0.1.11
	gix-transport@0.44.0
	gix-traverse@0.43.1
	gix-url@0.28.2
	gix-utils@0.1.13
	gix-validate@0.9.2
	gix@0.69.1
	globset@0.4.15
	h2@0.4.7
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.2
	hdrhistogram@7.5.4
	heck@0.5.0
	hermit-abi@0.4.0
	hex@0.4.3
	hifijson@0.2.2
	home@0.5.11
	http-body-util@0.1.2
	http-body@1.0.1
	http@1.2.0
	httparse@1.9.5
	httpdate@1.0.3
	humantime@2.1.0
	hyper-timeout@0.5.2
	hyper-util@0.1.10
	hyper@1.5.2
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	idna@1.0.3
	idna_adapter@1.2.0
	ignore@0.4.23
	indexmap@1.9.3
	indexmap@2.7.0
	inotify-sys@0.1.5
	inotify@0.11.0
	is-terminal@0.4.13
	is_ci@1.2.0
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itertools@0.9.0
	itoa@1.0.14
	jaq-core@2.0.0
	jaq-json@1.0.0
	jaq-std@2.0.0
	jiff-tzdb-platform@0.1.1
	jiff-tzdb@0.1.1
	jiff@0.1.21
	js-sys@0.3.76
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy_static@1.5.0
	libc@0.2.169
	libm@0.2.11
	libmimalloc-sys@0.1.39
	libredox@0.1.3
	linux-raw-sys@0.4.15
	listenfd@1.0.2
	litemap@0.7.4
	lock_api@0.4.12
	log@0.4.22
	mac-notification-sys@0.6.2
	malloc_buf@0.0.6
	matchers@0.1.0
	matchit@0.7.3
	maybe-async@0.2.10
	memchr@2.7.4
	memmap2@0.9.5
	memoffset@0.9.1
	miette-derive@7.4.0
	miette@7.4.0
	mimalloc@0.1.43
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.8.2
	mio@1.0.3
	nibble_vec@0.1.0
	nix@0.29.0
	nom@7.1.3
	normalize-line-endings@0.3.0
	normalize-path@0.2.1
	notify-rust@4.11.3
	notify-types@2.0.0
	notify@8.0.0
	nu-ansi-term@0.46.0
	num-complex@0.4.6
	num-conv@0.1.0
	num-traits@0.2.19
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	object@0.36.7
	once_cell@1.20.2
	option-ext@0.2.0
	ordered-stream@0.2.0
	origin@0.24.0
	os_str_bytes@7.0.0
	overload@0.1.1
	owo-colors@4.1.0
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	percent-encoding@2.3.1
	phf@0.11.3
	phf_codegen@0.11.3
	phf_generator@0.11.3
	phf_shared@0.11.3
	pid1@0.1.4
	pin-project-internal@1.1.8
	pin-project-lite@0.2.16
	pin-project@1.1.8
	pin-utils@0.1.0
	piper@0.2.4
	polling@3.7.4
	portable-atomic-util@0.2.4
	portable-atomic@1.10.0
	posix-regex@0.1.1
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	printf-compat@0.1.1
	proc-macro-crate@3.2.0
	proc-macro2@1.0.93
	process-wrap@8.2.0
	prodash@29.0.0
	prost-derive@0.13.4
	prost-types@0.13.4
	prost@0.13.4
	quick-xml@0.31.0
	quote@1.0.38
	radix_trie@0.2.1
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_pcg@0.3.1
	rayon-core@1.12.1
	realpath-ext@0.1.3
	redox_syscall@0.5.8
	redox_users@0.4.6
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-lite@0.1.6
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	roff@0.2.2
	rustc-demangle@0.1.24
	rustc_version@0.4.1
	rustix-dlmalloc@0.1.7
	rustix-futex-sync@0.2.3
	rustix-openpty@0.1.1
	rustix@0.38.43
	rustversion@1.0.19
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.24
	serde@1.0.217
	serde_derive@1.0.217
	serde_json@1.0.135
	serde_repr@0.1.19
	serde_spanned@0.6.8
	sha1@0.10.6
	sha1_smol@1.0.1
	sharded-slab@0.1.7
	shell-words@1.1.0
	shlex@1.3.0
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	similar@2.6.0
	siphasher@1.0.1
	slab@0.4.9
	smallvec@1.13.2
	snapbox-macros@0.3.10
	snapbox@0.6.21
	socket2@0.5.8
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	strsim@0.11.1
	supports-color@3.0.2
	supports-hyperlinks@3.1.0
	supports-unicode@3.0.0
	syn@2.0.96
	sync_wrapper@1.0.2
	synstructure@0.13.1
	tauri-winrt-notification@0.2.1
	tempfile@3.15.0
	termcolor@1.4.1
	terminal_size@0.4.1
	terminfo@0.9.0
	textwrap@0.16.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	thread_local@1.1.8
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tinystr@0.7.6
	tinyvec@1.8.1
	tinyvec_macros@0.1.1
	tokio-macros@2.5.0
	tokio-stream@0.1.17
	tokio-util@0.7.13
	tokio@1.43.0
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	tonic@0.12.3
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.4.13
	tower@0.5.2
	tracing-appender@0.2.3
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-log@0.2.0
	tracing-serde@0.2.0
	tracing-subscriber@0.3.19
	tracing-test-macro@0.2.5
	tracing-test@0.2.5
	tracing@0.1.41
	try-lock@0.2.5
	typed-arena@2.0.2
	typenum@1.17.0
	tz-rs@0.7.0
	uds_windows@1.1.0
	unicode-bom@2.0.3
	unicode-ident@1.0.14
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.24
	unicode-width@0.1.14
	unwinding@0.2.5
	url@2.5.4
	urlencoding@2.1.3
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	uuid@1.11.1
	valuable@0.1.0
	version_check@0.9.5
	vswhom-sys@0.1.2
	vswhom@0.1.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.99
	wasm-bindgen-macro-support@0.2.99
	wasm-bindgen-macro@0.2.99
	wasm-bindgen-shared@0.2.99
	wasm-bindgen@0.2.99
	which@7.0.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.56.0
	windows-core@0.59.0
	windows-implement@0.56.0
	windows-implement@0.59.0
	windows-interface@0.56.0
	windows-interface@0.59.0
	windows-result@0.1.2
	windows-result@0.3.0
	windows-strings@0.3.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows-targets@0.53.0
	windows-version@0.1.2
	windows@0.56.0
	windows@0.59.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.0
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.0
	winnow@0.6.24
	winreg@0.52.0
	winsafe@0.0.19
	write16@1.0.0
	writeable@0.5.5
	xdg-home@1.3.0
	yoke-derive@0.7.5
	yoke@0.7.5
	zbus@4.4.0
	zbus_macros@4.4.0
	zbus_names@3.0.0
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zerofrom-derive@0.1.5
	zerofrom@0.1.5
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zvariant@4.2.0
	zvariant_derive@4.2.0
	zvariant_utils@2.1.0
"

# MSRV as of watchexec-2.2.1 is 1.61.
#RUST_MIN_VER="1.71.1"

inherit cargo shell-completion

DESCRIPTION="Executes commands in response to file modifications"
HOMEPAGE="https://watchexec.github.io"
SRC_URI="
	https://github.com/watchexec/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-3.0 WTFPL-2
	ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
# Prevent portage from trying to fetch bunch of *.crate from mirror despite they are not mirrored.
RESTRICT="mirror"

DOCS=( crates/cli/README.md )

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

src_compile() {
	cargo_src_compile --manifest-path=crates/cli/Cargo.toml
}

src_test() {
	cargo_src_test --manifest-path crates/lib/Cargo.toml --lib
	cargo_src_test --manifest-path crates/cli/Cargo.toml
}

src_install() {
	cargo_src_install --path "${S}"/crates/cli

	einstalldocs
	doman doc/watchexec.1

	newbashcomp completions/bash "${PN}"

	newzshcomp completions/zsh "_${PN}"

	newfishcomp completions/fish "${PN}.fish"
}
