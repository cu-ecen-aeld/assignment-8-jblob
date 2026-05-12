#!/bin/bash
# Umgebung laden
source poky/oe-init-build-env build

# QEMU starten. Er verwendet automatisch das Image aus dem persistenten /build/tmp Ordner.
# Das slirp-Argument sorgt dafür, dass unser Port-Forwarding aus der local.conf aktiv wird.
runqemu nographic slirp
