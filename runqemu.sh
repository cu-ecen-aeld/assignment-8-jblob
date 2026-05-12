#!/bin/bash
# Umgebung im vorhandenen build-Ordner laden
source poky/oe-init-build-env build

# Startet QEMU mit User-Networking. 
# QB_SLIRP_OPT aus der local.conf übernimmt das Port-Forwarding (10022).
runqemu nographic slirp
