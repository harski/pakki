# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_DEPEND="2"

inherit python

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
	dev-lang/php[bcmath,curl,simplexml]"
RDEPEND="${DEPEND}"

S=${WORKDIR}/aajanki-yle-dl-38cb68d


src_unpack() {
	cp ${DISTDIR}/AdobeHDS.php ${WORKDIR}/

	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_prepare() {
	python_convert_shebangs -r 2 .
	sed -i 's|/usr/local/share/yle-dl/AdobeHDS.php|/usr/bin/AdobeHDS.php|g' yle-dl
}

src_compile() {
	if [ -f Makefile ]; then
		emake -j1 prefix="${DESTTREE}" || die "emake failed"
	fi
}

src_install() {
	einstall
	dobin ${WORKDIR}/AdobeHDS.php
}

pkg_setup() {
	python_pkg_setup
	python_set_active_version 2
}
