# Copyright 2015-2017 Tuomo Hartikainen <tth@harski.org>
# Distributed under the terms of the GNU General Public License v2

EAPI=6
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
KEYWORDS="amd64"
IUSE="+adobehds +youtube-dl"
REQUIRED_USE="adobehds"

RDEPEND="
	adobehds? ( dev-lang/php:*[bcmath,curl,simplexml] )
	dev-python/pycrypto
	media-video/rtmpdump
	youtube-dl? ( net-misc/youtube-dl[${PYTHON_USEDEP}] )
"

src_prepare() {
	python_fix_shebang .
	sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/share/yle-dl/AdobeHDS.php|g' yle-dl
	eapply_user
}

src_compile() {
	# Nothing to compile
	return
}

src_install() {
	emake DESTDIR="${D}" prefix="/usr" install
	DOCS="COPYING ChangeLog README.fi README.md"
	einstalldocs
}
