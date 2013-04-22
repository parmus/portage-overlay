# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils
DESCRIPTION="Spotify Desktop Client"
HOMEPAGE="http://www.spotify.com"
SRC_URI="http://repository.spotify.com/pool/non-free/s/spotify/spotify-client_0.8.8.323.gd143501.250-1_amd64.deb"
LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RESTRICT="mirror strip"

DEPEND="!dev-libs/openssl:0.9.8
	     dev-libs/openssl:0
		 media-libs/libpng:1.2"
RDEPEND="${DEPEND}"

src_unpack(){
	unpack ${A}
	unpack ./data.tar.gz
}

src_prepare(){
	# link against openssl-1.0.0 as it crashes with 0.9.8
	sed -i -e 's/\(lib\(ssl\|crypto\).so\).0.9.8/\1.1.0.0/g' \
		opt/spotify/spotify-client/spotify || die "sed failed"
		# different NSPR / NSS library names for some reason
	sed -i -e 's/\(lib\(nss3\|nssutil3\|smime3\).so\).1d/\1.12/g' \
		-e 's/\(lib\(plc4\|nspr4\).so\).0d\(.\)/\1.9\3\3/g'	\
		opt/spotify/spotify-client/libcef.so || die "sed failed"
}

src_compile(){
	:
}

src_install(){
	mv ${WORKDIR}/usr ${D}
	mv ${WORKDIR}/opt ${D}
	mkdir -p ${D}/usr/lib
	
	cd ${D}/opt/spotify/spotify-client/Icons
	for SIZE in 16 22 24 32 48 64 128 256; do
		newicon -s $SIZE spotify-linux-$SIZE.png spotify-client.png
	done
	cd ${D}/opt/spotify/spotify-client/
	domenu spotify.desktop
}
