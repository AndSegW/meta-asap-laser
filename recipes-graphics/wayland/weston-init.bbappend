# Diciamo a Yocto di cercare i file extra (il nostro weston.ini) in questa directory
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://weston.ini"

# Aggiungiamo un'istruzione alla fase di installazione per copiare il nostro file
do_install:append() {
    install -d ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/
}

