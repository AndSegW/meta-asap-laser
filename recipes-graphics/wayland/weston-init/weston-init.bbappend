FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Aggiungiamo delay.conf alla lista dei file
SRC_URI += "file://weston.ini \
            file://delay.conf"

do_install:append() {
    install -d ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/

    # Installiamo la regola di ritardo di 3 secondi per systemd
    install -d ${D}${systemd_system_unitdir}/weston.service.d
    install -m 0644 ${WORKDIR}/delay.conf ${D}${systemd_system_unitdir}/weston.service.d/
}

# Diciamo a Yocto di impacchettare la nostra nuova cartella
FILES:${PN} += "${systemd_system_unitdir}/weston.service.d/"
