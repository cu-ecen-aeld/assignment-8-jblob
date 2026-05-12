#!/bin/bash
# Umgebung laden
source poky/oe-init-build-env build

# Wir nutzen QEMU_EXTRA_ARGS für das Port-Forwarding, falls nicht schon in der Shell gesetzt
if [ -z "$QEMU_EXTRA_ARGS" ]; then
    export QEMU_EXTRA_ARGS="-netdev user,id=net0,hostfwd=tcp::10022-:22 -device virtio-net-pci,netdev=net0"
fi

# Starte QEMU
# Wir lassen 'slirp' weg, da wir das Interface oben manuell via QEMU_EXTRA_ARGS definieren
runqemu nographic
