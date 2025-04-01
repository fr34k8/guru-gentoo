# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.14.0

EAPI=8

CRATES="
	adler2@2.0.0
	aho-corasick@1.1.3
	aligned-vec@0.5.0
	anes@0.1.6
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.97
	approx@0.5.1
	arbitrary@1.4.1
	arg_enum_proc_macro@0.3.4
	arrayvec@0.7.6
	autocfg@1.4.0
	av1-grain@0.2.3
	avif-serialize@0.8.3
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.9.0
	bitstream-io@2.6.0
	built@0.7.7
	bumpalo@3.17.0
	by_address@1.2.1
	bytemuck@1.22.0
	byteorder-lite@0.1.0
	camino@1.1.9
	cargo-platform@0.1.9
	cargo_metadata@0.19.2
	cast@0.3.0
	cc@1.2.17
	cfg-expr@0.15.8
	cfg-if@1.0.0
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@4.5.32
	clap_builder@4.5.32
	clap_complete@4.5.47
	clap_derive@4.5.32
	clap_lex@0.7.4
	clap_mangen@0.2.26
	color_quant@1.1.0
	colorchoice@1.0.3
	convert_case@0.6.0
	crc32fast@1.4.2
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.3
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	deranged@0.4.0
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	dirs-sys@0.4.1
	dirs-sys@0.5.0
	dirs@5.0.1
	dirs@6.0.0
	displaydoc@0.2.5
	document-features@0.2.11
	documented-macros@0.9.1
	documented@0.9.1
	dunce@1.0.5
	dyn-clone@1.0.19
	either@1.15.0
	equivalent@1.0.2
	errno@0.3.10
	exr@1.73.0
	fast-srgb8@1.0.0
	fast_image_resize@5.1.2
	fastrand@2.3.0
	fdeflate@0.3.7
	flate2@1.1.0
	fnv@1.0.7
	form_urlencoded@1.2.1
	getrandom@0.2.15
	getrandom@0.3.2
	gif@0.13.1
	git2@0.20.1
	glob@0.3.2
	half@2.5.0
	hashbrown@0.15.2
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.5.0
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
	ident_case@1.0.1
	idna@1.0.3
	idna_adapter@1.2.0
	image-webp@0.2.1
	image@0.25.5
	imgref@1.11.0
	indexmap@2.8.0
	interpolate_name@0.2.4
	is-terminal@0.4.16
	is_terminal_polyfill@1.70.1
	itertools@0.10.5
	itertools@0.12.1
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.15
	jobserver@0.1.32
	jpeg-decoder@0.3.1
	js-sys@0.3.77
	kmeans_colors@0.6.0
	lazy_static@1.5.0
	lebe@0.5.2
	libc@0.2.171
	libfuzzer-sys@0.4.9
	libgit2-sys@0.18.1+1.9.0
	libredox@0.1.3
	libz-sys@1.1.22
	linux-raw-sys@0.9.3
	litemap@0.7.5
	litrs@0.4.1
	log@0.4.26
	loop9@0.1.5
	maplit@1.0.2
	maybe-rayon@0.1.1
	memchr@2.7.4
	memo-map@0.3.3
	minijinja@2.8.0
	minimal-lexical@0.2.1
	miniz_oxide@0.8.5
	new_debug_unreachable@1.0.6
	nom@7.1.3
	noop_proc_macro@0.3.0
	num-bigint@0.4.6
	num-conv@0.1.0
	num-derive@0.4.2
	num-integer@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	num_threads@0.1.7
	once_cell@1.21.1
	oorandom@11.1.5
	optfield@0.3.0
	option-ext@0.2.0
	owo-colors@4.2.0
	palette@0.7.6
	palette_derive@0.7.6
	paste@1.0.15
	percent-encoding@2.3.1
	phf@0.11.3
	phf_generator@0.11.3
	phf_macros@0.11.3
	phf_shared@0.11.3
	pkg-config@0.3.32
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	png@0.17.16
	powerfmt@0.2.0
	ppv-lite86@0.2.21
	proc-macro2@1.0.94
	profiling-procmacros@1.0.16
	profiling@1.0.16
	qoi@0.4.1
	quick-error@2.0.1
	quote@1.0.40
	r-efi@5.2.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rav1e@0.7.1
	ravif@0.11.11
	rayon-core@1.12.1
	rayon@1.10.0
	redox_users@0.4.6
	redox_users@0.5.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	rgb@0.8.50
	roff@0.2.2
	rustix@1.0.3
	rustversion@1.0.20
	ryu@1.0.20
	same-file@1.0.6
	schemars@0.8.22
	schemars_derive@0.8.22
	self_cell@1.1.0
	semver@1.0.26
	serde@1.0.219
	serde_derive@1.0.219
	serde_derive_internals@0.29.1
	serde_json@1.0.140
	serde_spanned@0.6.8
	shellexpand@3.1.0
	shlex@1.3.0
	simd-adler32@0.3.7
	simd_helpers@0.1.0
	siphasher@1.0.1
	smallvec@1.14.0
	spinners@4.1.1
	stable_deref_trait@1.2.0
	strsim@0.11.1
	strum@0.24.1
	strum@0.26.3
	strum@0.27.1
	strum_macros@0.24.3
	strum_macros@0.26.4
	strum_macros@0.27.1
	syn@1.0.109
	syn@2.0.100
	synstructure@0.13.1
	system-deps@6.2.2
	target-lexicon@0.12.16
	tempfile@3.19.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.12
	thiserror@1.0.69
	thiserror@2.0.12
	tiff@0.9.1
	time-core@0.1.4
	time-macros@0.2.21
	time@0.3.40
	tinystr@0.7.6
	tinytemplate@1.2.1
	toml@0.8.20
	toml_datetime@0.6.8
	toml_edit@0.22.24
	unicode-ident@1.0.18
	unicode-segmentation@1.12.0
	url@2.5.4
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	v_frame@0.3.8
	vcpkg@0.2.15
	vergen-git2@1.0.5
	vergen-lib@0.1.6
	vergen@9.0.4
	version-compare@0.2.0
	walkdir@2.5.0
	wallust@3.3.0
	wallust_themes@1.1.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.14.2+wasi-0.2.4
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	web-sys@0.3.77
	weezl@0.1.8
	winapi-util@0.1.9
	windows-sys@0.48.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.7.4
	wit-bindgen-rt@0.39.0
	write16@1.0.0
	writeable@0.5.5
	yoke-derive@0.7.5
	yoke@0.7.5
	zerocopy-derive@0.8.24
	zerocopy@0.8.24
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zune-core@0.4.12
	zune-inflate@0.2.54
	zune-jpeg@0.4.14
"

inherit cargo

DESCRIPTION="Generate a 16 color scheme based on an image."
HOMEPAGE="https://explosion-mental.codeberg.page/wallust"
SRC_URI="
	${CARGO_CRATE_URIS}
"

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD MIT MPL-2.0
	UoI-NCSA Unicode-3.0
"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED=".*"
QA_PRESTRIPPED=".*"
