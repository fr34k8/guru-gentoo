# Copyright 2021-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	aes@0.8.4
	aho-corasick@1.1.3
	anstream@0.6.14
	anstyle-parse@0.2.4
	anstyle-query@1.1.0
	anstyle-wincon@3.0.3
	anstyle@1.0.7
	anyhow@1.0.86
	argon2@0.5.3
	arrayvec@0.7.4
	async-trait@0.1.80
	autocfg@1.3.0
	axum-core@0.4.3
	axum@0.7.5
	backtrace@0.3.73
	base32@0.5.0
	base64@0.22.1
	base64ct@1.6.0
	bitflags@1.3.2
	bitflags@2.6.0
	blake2@0.10.6
	block-buffer@0.10.4
	block-padding@0.3.3
	block@0.1.6
	bumpalo@3.16.0
	byteorder@1.5.0
	bytes@1.6.0
	calloop-wayland-source@0.2.0
	calloop@0.12.4
	cbc@0.1.2
	cc@1.0.101
	cfg-if@1.0.0
	cipher@0.4.4
	clap@4.5.7
	clap_builder@4.5.7
	clap_complete@4.5.6
	clap_derive@4.5.5
	clap_lex@0.7.1
	clipboard-win@3.1.1
	colorchoice@1.0.1
	concurrent-queue@2.5.0
	const-oid@0.9.6
	copypasta@0.10.1
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	cpufeatures@0.2.12
	crossbeam-utils@0.8.20
	crypto-common@0.1.6
	cursor-icon@1.1.0
	daemonize@0.5.0
	data-encoding@2.6.0
	der@0.7.9
	digest@0.10.7
	directories@5.0.0
	dirs-sys@0.4.0
	dlib@0.5.2
	downcast-rs@1.2.1
	env_filter@0.1.0
	env_logger@0.11.3
	errno@0.3.9
	fastrand@2.1.0
	fnv@1.0.7
	form_urlencoded@1.2.1
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	futures@0.3.30
	generic-array@0.14.7
	gethostname@0.4.3
	getrandom@0.2.15
	gimli@0.29.0
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hkdf@0.12.4
	hmac@0.12.1
	http-body-util@0.1.2
	http-body@1.0.0
	http@1.1.0
	httparse@1.9.4
	httpdate@1.0.3
	humantime@2.1.0
	hyper-rustls@0.27.2
	hyper-util@0.1.5
	hyper@1.3.1
	idna@0.5.0
	inout@0.1.3
	ipnet@2.9.0
	is-docker@0.2.0
	is-terminal@0.4.12
	is-wsl@0.4.0
	is_terminal_polyfill@1.70.0
	itoa@1.0.11
	js-sys@0.3.69
	lazy-bytes-cast@5.0.1
	lazy_static@1.5.0
	libc@0.2.155
	libloading@0.8.4
	libm@0.2.8
	libredox@0.1.3
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	log@0.4.21
	mach2@0.4.2
	malloc_buf@0.0.6
	matchit@0.7.3
	memchr@2.7.4
	memmap2@0.9.4
	mime@0.3.17
	miniz_oxide@0.7.4
	mio@0.8.11
	num-bigint-dig@0.8.4
	num-integer@0.1.46
	num-iter@0.1.45
	num-traits@0.2.19
	num_cpus@1.16.0
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	object@0.36.0
	once_cell@1.19.0
	open@5.1.4
	openssl-probe@0.1.5
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	password-hash@0.5.0
	paste@1.0.15
	pathdiff@0.2.1
	pbkdf2@0.12.2
	pem-rfc7468@0.7.0
	percent-encoding@2.3.1
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-project@1.1.5
	pin-utils@0.1.0
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.30
	polling@3.7.2
	ppv-lite86@0.2.17
	proc-macro2@1.0.86
	quick-xml@0.31.0
	quinn-proto@0.11.3
	quinn-udp@0.5.2
	quinn@0.11.2
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.5.2
	redox_users@0.4.5
	regex-automata@0.4.7
	regex-syntax@0.8.4
	regex@1.10.5
	region@3.0.2
	reqwest@0.12.5
	ring@0.17.8
	rmp@0.8.14
	rmpv@1.3.0
	rsa@0.9.6
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustix@0.38.34
	rustls-native-certs@0.7.0
	rustls-pemfile@2.1.2
	rustls-pki-types@1.7.0
	rustls-webpki@0.102.4
	rustls@0.23.10
	rustversion@1.0.17
	ryu@1.0.18
	schannel@0.1.23
	scoped-tls@1.0.1
	scopeguard@1.2.0
	security-framework-sys@2.11.0
	security-framework@2.11.0
	serde@1.0.203
	serde_derive@1.0.203
	serde_json@1.0.118
	serde_path_to_error@0.1.16
	serde_repr@0.1.19
	serde_urlencoded@0.7.1
	sha1@0.10.6
	sha2@0.10.8
	signal-hook-registry@1.4.2
	signature@2.2.0
	slab@0.4.9
	smallvec@1.13.2
	smawk@0.3.2
	smithay-client-toolkit@0.18.1
	smithay-clipboard@0.7.1
	socket2@0.5.7
	spin@0.9.8
	spki@0.7.3
	strsim@0.11.1
	subtle@2.6.1
	syn@2.0.68
	sync_wrapper@0.1.2
	sync_wrapper@1.0.1
	tempfile@3.10.1
	terminal_size@0.3.0
	textwrap@0.16.1
	thiserror-impl@1.0.61
	thiserror@1.0.61
	tinyvec@1.6.1
	tinyvec_macros@0.1.1
	tokio-macros@2.3.0
	tokio-rustls@0.26.0
	tokio-stream@0.1.15
	tokio-tungstenite@0.23.1
	tokio@1.38.0
	totp-lite@2.0.1
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing@0.1.40
	try-lock@0.2.5
	tungstenite@0.23.0
	typenum@1.17.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-linebreak@0.1.5
	unicode-normalization@0.1.23
	unicode-width@0.1.13
	untrusted@0.9.0
	url@2.5.2
	urlencoding@2.1.3
	utf-8@0.7.6
	utf8parse@0.2.2
	uuid@1.9.1
	version_check@0.9.4
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-futures@0.4.42
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	wayland-backend@0.3.4
	wayland-client@0.31.3
	wayland-csd-frame@0.3.0
	wayland-cursor@0.31.3
	wayland-protocols-wlr@0.2.0
	wayland-protocols@0.31.2
	wayland-scanner@0.31.2
	wayland-sys@0.31.2
	web-sys@0.3.69
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winreg@0.52.0
	x11-clipboard@0.9.2
	x11rb-protocol@0.13.1
	x11rb@0.13.1
	xcursor@0.3.5
	xkeysym@0.2.1
	zeroize@1.8.1
"

RUST_MIN_VER="1.74.1"

inherit cargo optfeature shell-completion

DESCRIPTION="Unofficial Bitwarden CLI"
HOMEPAGE="https://git.tozt.net/rbw"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://git.tozt.net/rbw"
else
	SRC_URI="https://git.tozt.net/rbw/snapshot/${P}.tar.gz
		${CARGO_CRATE_URIS}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD Boost-1.0 ISC MIT Unicode-DFS-2016"
# Manually added crate licenses
LICENSE+=" openssl"
SLOT="0"

RDEPEND="app-crypt/pinentry"

PATCHES="${FILESDIR}"/${P}-gen-completions.patch

QA_FLAGS_IGNORED="
	usr/bin/rbw
	usr/bin/rbw-agent
"

src_unpack() {
	if [[ ${PV} = *9999* ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	# cc-rs picks up CFLAGS from the env
	export CFLAGS
	cargo_src_compile
}

src_install() {
	cargo_src_install

	local comp DOCS="CHANGELOG.md README.md"
	for comp in bash fish zsh; do
		"$(cargo_target_dir)"/rbw gen-completions ${comp} > rbw.${comp} || \
			die "Failed to generate completions for ${comp}."
	done
	newbashcomp rbw.bash rbw
	dofishcomp rbw.fish
	newzshcomp rbw.zsh _rbw
	einstalldocs
}

pkg_postinst() {
	# copypasta crate provides wayland clipboard support via dlopen calls against
	# libwayland-client.so
	optfeature "Wayland clipboard support" dev-libs/wayland
}
