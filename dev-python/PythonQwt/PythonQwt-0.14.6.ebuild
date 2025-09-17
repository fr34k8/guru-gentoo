# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Qt plotting widgets for Python"
HOMEPAGE="https://pypi.org/project/PythonQwt"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"
# Test directory seems to contain demo instead
RESTRICT="test"

RDEPEND="
	dev-python/pyqt6[${PYTHON_USEDEP},svg]
	dev-python/numpy[${PYTHON_USEDEP}]
"
