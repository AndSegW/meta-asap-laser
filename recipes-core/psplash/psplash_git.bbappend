FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Diciamo a Yocto di generare psplash usando la TUA immagine (outsuffix=default sovrascrive il logo Yocto)
SPLASH_IMAGES = "file://asap.png;outsuffix=default"

# Aggiungiamo il nostro drop-in per far aspettare il framebuffer
SRC_URI += "file://psplash-wait-fb.conf"

do_install:append() {
    # Installiamo il drop-in nella cartella di configurazione originale di psplash
    install -d ${D}${systemd_system_unitdir}/psplash-start.service.d
    install -m 0644 ${WORKDIR}/psplash-wait-fb.conf ${D}${systemd_system_unitdir}/psplash-start.service.d/
}

# Diciamo a Yocto di mettere il file nel pacchetto finale
FILES:${PN} += "${systemd_system_unitdir}/psplash-start.service.d/"
