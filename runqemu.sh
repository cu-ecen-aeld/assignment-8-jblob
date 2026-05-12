#!/bin/bash

# Start Yocto QEMU correctly
source poky/oe-init-build-env
export QEMU_EXTRA_ARGS="-netdev user,id=net0,hostfwd=tcp::10022-:22"
runqemu nographic slirp
#runqemu qemux86-64 nographic slirp
