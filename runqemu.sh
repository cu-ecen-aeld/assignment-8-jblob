#!/bin/bash
# Initialisiere die Bitbake Umgebung (relativ zum Projekt-Root)
source poky/oe-init-build-env build

# Starte QEMU
# nographic: Ausgabe in der Konsole
# slirp: Aktiviert das User-Mode-Networking (nutzt QB_SLIRP_OPT aus der local.conf)
runqemu nographic slirp
