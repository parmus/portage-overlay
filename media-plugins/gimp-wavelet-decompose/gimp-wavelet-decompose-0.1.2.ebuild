# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Wavelet Decomposition plugin for GIMP"
HOMEPAGE="http://registry.gimp.org/node/11742"
SRC_URI="http://registry.gimp.org/files/wavelet-decompose-0.1.2.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="media-gfx/gimp"
RDEPEND="${DEPEND}"
S=${WORKDIR}/wavelet-decompose-${PV}

src_install() {
	exeinto $(gimptool-2.0 --gimpplugindir)/plug-ins
	doexe src/wavelet-decompose

	LOCALEDIR=${D}usr/share/locale
	cd ${S}/po
	for L in *.mo; do
		install -D -v -m 0644 $L "${LOCALEDIR}/${L%.mo}/LC_MESSAGES/gimp20-wavelet-decompose-plug-in.mo"
	done
}
