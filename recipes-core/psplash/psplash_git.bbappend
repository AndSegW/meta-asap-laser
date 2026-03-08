FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Usiamo il nome esatto del tuo file
SPLASH_IMAGES = "file://asap.png;outsuffix=default"
SRC_URI += "file://asap-splash.service"

# LA MAGIA: Diciamo a Yocto di disabilitare la ricerca del vecchio script SysVinit
INITSCRIPT_PACKAGES = ""

inherit systemd
SYSTEMD_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = "asap-splash.service"
SYSTEMD_AUTO_ENABLE = "enable"

do_install:append() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/asap-splash.service ${D}${systemd_system_unitdir}/

    # Ora possiamo rimuovere il vecchio script senza far arrabbiare Yocto
    rm -f ${D}${sysconfdir}/init.d/psplash.sh

    rm -f ${D}${systemd_system_unitdir}/psplash-systemd.service
    rm -f ${D}${systemd_system_unitdir}/psplash-start.service
}

FILES:${PN} += "${bindir}/psplash ${systemd_system_unitdir}/asap-splash.service"

