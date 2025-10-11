# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DOCS_AUTODOC=0
DOCS_BUILDER="sphinx"
DOCS_DIR="docs"

# PYPI_NO_NORMALIZE=1

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1 docs pypi

DESCRIPTION="Sphinx extension to generate unique OpenGraph metadata"
HOMEPAGE="https://github.com/wpilibsuite/sphinxext-opengraph https://pypi.org/project/sphinxext-opengraph/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/myst-parser[${PYTHON_USEDEP}]
	dev-python/furo[${PYTHON_USEDEP}]
	dev-python/sphinx-design[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
"
BDEPEND="
	doc? (
		${RDEPEND}
		dev-python/accessible-pygments[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
