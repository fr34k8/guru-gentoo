# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
"

inherit cargo

DESCRIPTION="A diff filter highlighting changed line parts"
HOMEPAGE="https://github.com/walles/riff/"
SRC_URI="https://github.com/walles/riff/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://raw.githubusercontent.com/PPN-SD/vendor/refs/tags/${P}/${P}-crates.tar.xz"
S="${WORKDIR}/${P/diff/}"

LICENSE="MIT"
# Autogenerated by pycargoebuild
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD-2 BSD MIT Unicode-3.0 Unicode-DFS-2016"
SLOT="0"
KEYWORDS="~amd64"

QA_FLAGS_IGNORED="usr/bin/riff"
