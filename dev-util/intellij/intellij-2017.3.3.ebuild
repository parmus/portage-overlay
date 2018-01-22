# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils

DESCRIPTION="PyCharm - Python IDE"
HOMEPAGE="http://www.jetbrains.com/pycharm/"
SRC_URI="ultimate? ( http://download.jetbrains.com/idea/ideaIU-${PV}.tar.gz )
         !ultimate? ( http://download.jetbrains.com/idea/ideaIC-${PV}.tar.gz )"
RESTRICT="mirror strip"

LICENSE=""
SLOT="0"
KEYWORDS="amd64"
IUSE="ultimate"

DEPEND="
     || (
             >=dev-java/oracle-jre-bin-1.7
		     >=dev-java/oracle-jdk-bin-1.7
     )"
RDEPEND="${DEPEND}"

src_compile() {
	:
}

src_install() {
	IDEA_PATH=$(ls -d ${WORKDIR}/idea-I*)
	IDEA_DIR=${IDEA_PATH##*/}

	dodir /opt
	mv ${WORKDIR}/${IDEA_DIR} ${D}/opt/

	dodir /usr/bin
	ln -s /opt/${IDEA_DIR}/bin/idea.sh ${D}/usr/bin/

	dodir /usr/share/applications
	cat > ${D}/usr/share/applications/jetbrain-intellij.desktop <<-DESKTOPENTRY
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=IntelliJ
		Exec="/opt/${IDEA_DIR}/bin/idea.sh" %f
		Icon=/opt/${IDEA_DIR}/bin/idea.png
		Comment=Work Miracles in Java and Beyond!
		Categories=Development;IDE;
		Terminal=false
		StartupNotify=true
		StartupWMClass=jetbrains-intellij
	DESKTOPENTRY
}
