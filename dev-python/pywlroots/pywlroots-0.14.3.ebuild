# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..10} )
inherit distutils-r1

DESCRIPTION="Python binding to the wlroots library using cffi"
HOMEPAGE="https://github.com/flacjacket/pywlroots"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="NCSA"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
		dev-python/pywayland-0.1.1
		>=x11-libs/libxkbcommon-0.2"
RDEPEND="${DEPEND}"
BDEPEND=""
