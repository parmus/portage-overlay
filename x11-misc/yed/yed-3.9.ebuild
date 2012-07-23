# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="yEd Graph Editor"
HOMEPAGE="http://www.yworks.com"
SRC_URI="http://www.yworks.com/products/yed/demo/yEd-${PV}.zip"

LICENSE="as-is"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-java/sun-jdk:1.6"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	dodir /opt/yed
	mv ${S}/yed.jar ${D}/opt/yed
	dodir /usr/share/doc/${P}
	mv ${S}/license.html ${D}/usr/share/doc/${P}
	dodir /usr/bin
	cat > ${D}/usr/bin/yed <<-HERE
		#!/bin/bash
		java -jar /opt/yed/yed.jar
	HERE
	chmod a+x ${D}/usr/bin/yed
}
