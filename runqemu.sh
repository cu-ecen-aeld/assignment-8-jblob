#!/bin/bash
# Umgebung laden
source poky/oe-init-build-env build

# Wir löschen Extra-Args, um Dopplungen zu vermeiden
export QEMU_EXTRA_ARGS=""

# Starte QEMU. 
# Da QB_SLIRP_OPT in der local.conf jetzt das komplette '-netdev' enthält,
# wird runqemu dies korrekt in die Befehlszeile einbauen.
runqemu nographic slirp
