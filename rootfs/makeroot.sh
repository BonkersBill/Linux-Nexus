#!/bin/bash
set -x
pushd ..
    sudo cp arch/arm64/boot/Image.gz            rootfs/files/boot/firmware/$(date +%y%m%d)_$KERNEL.img
    sudo cp arch/arm64/boot/dts/broadcom/*.dtb  rootfs/files/boot/firmware
    sudo cp arch/arm64/boot/dts/overlays/*.dtb* rootfs/files/boot/firmware/overlays
    sudo cp arch/arm64/boot/dts/overlays/README rootfs/files/boot/firmware/overlays
popd
pushd rootfs
    tar czf ../rootfs.tgz *
popd
