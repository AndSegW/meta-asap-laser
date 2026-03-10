# Diciamo a Yocto di cercare i file extra nella directory col nome del pacchetto (weston-init)
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Aggiungiamo ENTRAMBI i file
SRC_URI += "file://weston.ini \
            file://delay.conf"

do_install:append() {
    # 1. Installiamo la configurazione del Kiosk / Doppio Schermo
    install -d ${D}${sysconfdir}/xdg/weston
    install -m 0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/

    # 2. Installiamo la regola di ritardo di 3 secondi per Plymouth
    install -d ${D}${systemd_system_unitdir}/weston.service.d
    install -m 0644 ${WORKDIR}/delay.conf ${D}${systemd_system_unitdir}/weston.service.d/
}

# Diciamo a Yocto di impacchettare anche la nuova cartella systemd creata
FILES:${PN} += "${systemd_system_unitdir}/weston.service.d/"