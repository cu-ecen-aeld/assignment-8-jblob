#!/bin/bash
# Nutze die Bash explizit
# Pfade relativ zum Projekt-Root setzen
source poky/oe-init-build-env build

# Wir verlassen uns auf die QB_SLIRP_OPT in der local.conf
# Da runqemu.sh oft im Hintergrund gestartet wird, stellen wir sicher, 
# dass es das richtige Verzeichnis nutzt.
runqemu nographic slirp
