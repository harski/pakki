# Copyright 2015-2015 Tuomo Hartikainen <tth@harski.org>
# Distributed under the terms of the GNU General Public License v2

EAPI=5
PYTHON_COMPAT=(python{2_6,2_7})

inherit python-single-r1

DESCRIPTION="Download media files from Yle Areena"
HOMEPAGE="http://aajanki.github.io/yle-dl/"
SRC_URI="https://github.com/aajanki/yle-dl/tarball/${PV} -> ${P}.tar.gz
	https://raw.githubusercontent.com/harski/K-S-V-Scripts/107a0f617b80d81dba4b45446430283b1a383771/AdobeHDS.php"
RESTRICT="primaryuri"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/pycrypto
	media-video/rtmpdump
	dev-lang/php:*[bcmath,curl,simplexml]"
RDEPEND="${DEPEND}"

S=${WORKDIR}/aajanki-yle-dl-e9b547b

src_prepare() {
	python_fix_shebang .
	sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/share/yle-dl/AdobeHDS.php|g' yle-dl
}

src_compile() {
	# Nothing to compile
	return
}

src_install() {
	einstall
	insinto /usr/share/yle-dl
	doins "${DISTDIR}/AdobeHDS.php"
}
