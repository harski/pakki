# Copyright 2015-2016 Tuomo Hartikainen <tth@harski.org>
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
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="-adobehds +youtube-dl"

RDEPEND="
	adobehds? ( dev-lang/php:*[bcmath,curl,simplexml] )
	dev-python/pycrypto
	media-video/rtmpdump
	youtube-dl? ( net-misc/youtube-dl[${PYTHON_USEDEP}] )
"

src_prepare() {
	python_fix_shebang .
	if use youtube-dl && use !adobehds ; then
		epatch "${FILESDIR}/yle-dl-2.10.1-prefer-youtube-dl.patch"
	fi
	sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/share/yle-dl/AdobeHDS.php|g' yle-dl
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
