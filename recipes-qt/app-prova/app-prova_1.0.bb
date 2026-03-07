SUMMARY = "Applicazione Qt6 di prova per ASAP Laser"
LICENSE = "CLOSED" 

# Le dipendenze per compilare QML e Wayland
DEPENDS = "qtbase qtdeclarative qtwayland qtdeclarative-native"

# INSERISCI QUI IL LINK AL REPOSITORY DELLA TUA APP QT (NON IL LAYER YOCTO!)
SRC_URI = "git://github.com/AndSegW/raspberry_qt.git;protocol=https;branch=master"

# Prendi sempre l'ultimo commit
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

# Diciamo a Yocto che questo è un progetto CMake basato su Qt6
inherit qt6-cmake
