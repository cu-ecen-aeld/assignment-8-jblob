#!/bin/bash
# Script to start qemu

#source poky/oe-init-build-env
#export QB_SLIRP_OPT="-netdev user,id=net0,hostfwd=tcp::10022-:22,hostfwd=tcp::9000-:9000"
#runqemu slirp nographic

#qemu-system-i386 \
  -kernel buildroot/output/images/bzImage \
  -drive file=buildroot/output/images/rootfs.ext2,format=raw \
  -append "root=/dev/sda console=ttyS0 noapic ip=dhcp" \
  -netdev user,id=net0,hostfwd=tcp::10022-:22 \
  -device e1000,netdev=net0 \
  -nographic

qemu-system-i386 \
  -kernel buildroot/output/images/bzImage \
  -drive file=buildroot/output/images/rootfs.ext2,format=raw \
  -append "root=/dev/sda console=ttyS0 noapic ip=dhcp" \
  -netdev user,id=net0,hostfwd=tcp::10022-:22 \
  -device rtl8139,netdev=net0 \
  -nographic
