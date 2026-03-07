# Diciamo a Yocto di cercare i file nella nostra cartella 'files'
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Definiamo la nostra immagine custom
SPLASH_IMAGES = "file://asap.png;outsuffix=asap"
