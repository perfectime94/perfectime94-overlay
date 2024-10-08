# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aho-corasick@1.1.2
	anstream@0.6.11
	anstyle@1.0.6
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.7
	bitflags@1.3.2
	bitflags@2.4.2
	bumpalo@3.15.0
	bytes@1.5.0
	cc@1.0.83
	cfg-if@1.0.0
	clap@4.5.1
	clap_builder@4.5.1
	clap_derive@4.5.0
	clap_lex@0.7.0
	colorchoice@1.0.0
	colored@2.1.0
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	edit-distance@2.1.0
	encoding_rs@0.8.33
	env_logger@0.10.2
	equivalent@1.0.1
	errno@0.3.8
	fastrand@2.0.1
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.1
	futures@0.3.30
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	fuzzy-matcher@0.3.7
	getrandom@0.2.12
	gimli@0.28.1
	git2@0.18.2
	h2@0.3.24
	hashbrown@0.14.3
	heck@0.4.1
	hermit-abi@0.3.6
	http@0.2.11
	http-body@0.4.6
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper@0.14.28
	hyper-tls@0.5.0
	idna@0.5.0
	indexmap@2.2.3
	ipnet@2.9.0
	is-terminal@0.4.12
	itoa@1.0.10
	jobserver@0.1.28
	js-sys@0.3.68
	lazy_static@1.4.0
	leftwm-core@0.5.0
	leftwm-layouts@0.8.4
	libc@0.2.153
	libgit2-sys@0.16.2+1.7.2
	libredox@0.0.1
	libssh2-sys@0.3.0
	libz-sys@1.1.15
	linux-raw-sys@0.4.13
	log@0.4.20
	memchr@2.7.1
	mime@0.3.17
	miniz_oxide@0.7.2
	mio@0.8.10
	native-tls@0.2.11
	nix@0.27.1
	num_cpus@1.16.0
	object@0.32.2
	once_cell@1.19.0
	openssl@0.10.63
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.2.3+3.2.1
	openssl-sys@0.9.99
	percent-encoding@2.3.1
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.30
	pretty_env_logger@0.5.0
	proc-macro2@1.0.78
	quote@1.0.35
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex@1.10.3
	regex-automata@0.4.5
	regex-syntax@0.8.2
	reqwest@0.11.24
	ron@0.8.1
	rustc-demangle@0.1.23
	rustix@0.38.31
	rustls-pemfile@1.0.4
	ryu@1.0.16
	schannel@0.1.23
	security-framework@2.9.2
	security-framework-sys@2.9.1
	semver@1.0.21
	serde@1.0.196
	serde_derive@1.0.196
	serde_json@1.0.113
	serde_spanned@0.6.5
	serde_urlencoded@0.7.1
	signal-hook@0.3.17
	signal-hook-registry@1.4.1
	slab@0.4.9
	socket2@0.5.5
	strsim@0.11.0
	syn@2.0.49
	sync_wrapper@0.1.2
	system-configuration@0.5.1
	system-configuration-sys@0.5.0
	tempfile@3.10.0
	termcolor@1.4.1
	thiserror@1.0.57
	thiserror-impl@1.0.57
	thread_local@1.1.7
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.36.0
	tokio-macros@2.2.0
	tokio-native-tls@0.3.1
	tokio-util@0.7.10
	toml@0.8.10
	toml_datetime@0.6.5
	toml_edit@0.22.6
	tower-service@0.3.2
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	try-lock@0.2.5
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	url@2.5.0
	utf8parse@0.2.1
	vcpkg@0.2.15
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.91
	wasm-bindgen-backend@0.2.91
	wasm-bindgen-futures@0.4.41
	wasm-bindgen-macro@0.2.91
	wasm-bindgen-macro-support@0.2.91
	wasm-bindgen-shared@0.2.91
	web-sys@0.3.68
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.6.1
	winreg@0.50.0
	x11-dl@2.21.0
	xdg@2.5.2
"

inherit cargo

DESCRIPTION="A theme mangager for LeftWM"
HOMEPAGE="https://github.com/leftwm/leftwm-theme"
SRC_URI="
		https://github.com/leftwm/leftwm-theme/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
		${CARGO_CRATE_URIS}
"

# License set may be more restrictive as OR is not respected
# use cargo-license for a more accurate license picture
LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

QA_FLAGS_IGNORED="usr/bin/.*"
