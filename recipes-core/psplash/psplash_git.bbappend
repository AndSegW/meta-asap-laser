# Diciamo a Yocto di cercare i file nella nostra cartella 'files'
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Definiamo la nostra immagine custom
SPLASH_IMAGES = "file://asap.png;outsuffix=default"
SRC_URI += "file://psplash-wait-fb.conf"

do_install:append() {
    install -d ${D}${systemd_system_unitdir}/psplash-start.service.d
    install -m 0644 ${WORKDIR}/psplash-wait-fb.conf ${D}${systemd_system_unitdir}/psplash-start.service.d/
}
