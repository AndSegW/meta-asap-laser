FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SPLASH_IMAGES = "file://asap-logo.png;outsuffix=default"
SRC_URI += "file://asap-splash.service"

# Diciamo a Yocto di usare il nostro servizio
inherit systemd
SYSTEMD_SERVICE:${PN} += "asap-splash.service"
SYSTEMD_AUTO_ENABLE = "enable"

do_install:append() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/asap-splash.service ${D}${systemd_system_unitdir}/

    # Bruciamo il vecchio script che faceva impazzire systemd!
    rm -f ${D}${sysconfdir}/init.d/psplash.sh
}
