#!/bin/bash

# Start Yocto QEMU correctly
source poky/oe-init-build-env
runqemu qemux86-64 nographic slirp
