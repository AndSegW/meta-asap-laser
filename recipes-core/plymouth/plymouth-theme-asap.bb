SUMMARY = "ASAP Plymouth Theme"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

# Diciamo a Yocto dove trovare i nostri file (quelli che avevi già messo in files/)
SRC_URI = " \
    file://asap.plymouth \
    file://asap.script \
    file://asap.png \
"

# Non ci serve compilare codice C, quindi disabilitiamo le fasi di compilazione
do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install() {
    # Installiamo la cartella e i 3 file del tema
    install -d ${D}${datadir}/plymouth/themes/asap
    install -m 0644 ${WORKDIR}/asap.plymouth ${D}${datadir}/plymouth/themes/asap/
    install -m 0644 ${WORKDIR}/asap.script ${D}${datadir}/plymouth/themes/asap/
    install -m 0644 ${WORKDIR}/asap.png ${D}${datadir}/plymouth/themes/asap/
}

pkg_postinst_ontarget:${PN}() {
    plymouth-set-default-theme asap
}

# Diciamo a Yocto che tutti i file in /usr/share/plymouth/themes/asap fanno parte di questo pacchetto
FILES:${PN} += "${datadir}/plymouth/themes/asap/*"

# Diciamo che questo tema dipende da Plymouth per funzionare
RDEPENDS:${PN} += "plymouth"
