
EAPI=2
PYTHON_DEPEND="2"

inherit python

DESCRIPTION="Download media files from Yle Areena Beta"
HOMEPAGE="http://aajanki.github.com/yle-dl/"
SRC_URI="https://github.com/aajanki/${PN}/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ppc ~x86"

DEPEND="
	dev-python/pycrypto
	media-video/rtmpdump
	!media-video/rtmpdump-yle"
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}-${PV}
#: ${PREFIX:=/usr}

src_unpack() {
	if [ "${A}" != "" ]; then
		unpack ${A}
	fi
}

src_prepare() {
	python_convert_shebangs -r 2 .
}

src_compile() {
	if [ -f Makefile ]; then
		emake -j1 prefix="${DESTTREE}" || die "emake failed"
	fi
}

src_install() {
	einstall
}

pkg_setup() {
	python_set_active_version 2
}

