# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="PyCharm - Python IDE"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="professional? ( http://download.jetbrains.com/python/${PN}-professional-${PV}.tar.gz )
         !professional? ( http://download.jetbrains.com/python/${PN}-community-${PV}.tar.gz )"
RESTRICT="mirror strip"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="professional"

DEPEND="
     || (
             >=dev-java/oracle-jre-bin-1.6
		     >=dev-java/oracle-jdk-bin-1.6
     )
     dev-lang/python"
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
		Icon=/opt/${P}/bin/pycharm.png
		Comment=Develop with pleasure!
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=jetbrains-pycharm
	DESKTOPENTRY
}
