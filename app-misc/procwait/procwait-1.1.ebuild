# Copyright 2015-2015 Tuomo Hartikainen <tth@harski.org>
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Wait for a process to terminate."
HOMEPAGE="http://project.harski.org/procwait/"
SRC_URI="http://harski.org/${P}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	dodoc README
}
