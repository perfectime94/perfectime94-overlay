# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1

DESCRIPTION="Python bindings for the libwayland library"
HOMEPAGE="https://github.com/flacjacket/pywayland"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
		>=dev-python/cffi-1.12.0
		dev-libs/wayland
		dev-libs/wayland-protocols"
RDEPEND="${DEPEND}"
BDEPEND=""
