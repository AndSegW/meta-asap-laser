SUMMARY = "Applicazione Qt6 di prova per ASAP Laser"
LICENSE = "CLOSED" 

DEPENDS = "qtbase qtdeclarative qtwayland qtdeclarative-native"

RDEPENDS:${PN} += " \
    qtbase \
    qtwayland \
    qtdeclarative \
"
# Aggiunto il nostro file .service alla lista dei sorgenti
SRC_URI = "git://github.com/AndSegW/raspberry_qt.git;protocol=https;branch=master \
           file://app-prova.service"

SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"

# Diciamo a Yocto che questa ricetta installa anche un servizio systemd
inherit qt6-cmake systemd

# Configurazione del servizio
SYSTEMD_SERVICE:${PN} = "app-prova.service"
SYSTEMD_AUTO_ENABLE = "enable"

# Diciamo a Yocto di cercare nella cartella 'files'
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Istruzione per copiare fisicamente il file .service nella cartella corretta di Linux
do_install:append() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/app-prova.service ${D}${systemd_system_unitdir}/
}
