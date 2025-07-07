# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} pypy3_11 )
DISTUTILS_USE_PEP517="flit"
inherit distutils-r1 pypi

DESCRIPTION="Transliterate Cyrillic to Latin in every possible way"
HOMEPAGE="
	https://iuliia.ru/
	https://pypi.org/project/iuliia/
	https://github.com/nalgeon/iuliia-py
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

EPYTEST_PLUGINS=( )

distutils_enable_tests pytest
