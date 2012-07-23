# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="PyCharm - Python IDE"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="http://download.jetbrains.com/python/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="dev-java/sun-jdk:1.6 dev-lang/python"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	dodir /opt
	mv ${S} ${D}/opt/

	dodir /usr/bin
	ln -s /opt/${P}/bin/pycharm.sh ${D}/usr/bin/${PN}

	dodir /usr/share/applications
	cat > ${D}/usr/share/applications/jetbrain-pycharm.desktop <<-DESKTOPENTRY
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=PyCharm
		Exec="/opt/${P}/bin/pycharm.sh" %f
		Icon=/opt/${P}/bin/PyCharm_128.png
		Comment=Develop with pleasure!
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=jetbrains-pycharm
	DESKTOPENTRY
}
