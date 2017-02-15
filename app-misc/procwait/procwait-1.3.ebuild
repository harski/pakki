# Copyright 2015-2017 Tuomo Hartikainen <tth@harski.org>
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Wait for a process to terminate."
HOMEPAGE="https://github.com/harski/procwait"
SRC_URI="https://github.com/harski/procwait/archive/v${PV}.tar.gz"
RESTRICT="primaryuri"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install

	dodoc README.md
}
