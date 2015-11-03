# Copyright 2015-2015 Tuomo Hartikainen <tth@harski.org>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit eutils
inherit python-single-r1

DESCRIPTION="Download media files from Yle Areena"
HOMEPAGE="http://aajanki.github.io/yle-dl/"
GITHUB_USER="aajanki"
SRC_URI="https://github.com/${GITHUB_USER}/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/pycrypto
	media-video/rtmpdump
	net-misc/youtube-dl[${PYTHON_USEDEP}]
"

src_prepare() {
	python_fix_shebang .
	epatch "${FILESDIR}/${P}-prefer-youtube-dl.patch"
}

src_compile() {
	# Nothing to compile
	return
}

src_install() {
	emake prefix="${D}" install

	for doc in COPYING ChangeLog README.{fi,md}; do
		dodoc ${doc}
	done
}
