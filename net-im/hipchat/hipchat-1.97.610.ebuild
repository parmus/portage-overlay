# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Chat service"
HOMEPAGE="https://www.hipchat.com/linux"
SRC_URI="http://downloads.hipchat.com/linux/arch/x86_64/${P}-x86_64.pkg.tar.xz"
RESTRICT="mirror strip"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_compile(){
	sed -i \
		-e 's/Terminal=0/Terminal=false/' \
		-e 's/hipchat.png/hipchat/' \
		${S}/usr/share/applications/hipchat.desktop
}

src_install(){
	mv ${S}/opt ${S}/usr ${D}
}
