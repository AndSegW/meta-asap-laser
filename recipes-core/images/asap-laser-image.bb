SUMMARY = "Immagine custom per il progetto ASAP Laser"
LICENSE = "MIT"

# Ereditiamo tutte le funzioni di base di un'immagine Yocto standard
inherit core-image

# SBLOCCO DELLA PASSWORD:
# "debug-tweaks" è una funzione magica di Yocto che, tra le altre cose,
# permette di loggarsi come utente root senza dover inserire la password.
# È comodissimo durante lo sviluppo.
EXTRA_IMAGE_FEATURES += "debug-tweaks"

# INSTALLAZIONE SOFTWARE:
# Qui elenchiamo i pacchetti che vogliamo installare.
# Oltre ai tool di boot essenziali, aggiungiamo "psplash" per lo splash screen.
IMAGE_INSTALL += " \
    packagegroup-core-boot \
    psplash \
    wayland \
    weston \
    weston-init \
    qtbase \
    qtwayland \
    app-prova \
"
