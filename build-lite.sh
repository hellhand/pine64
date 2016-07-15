#!/bin/bash

set -ex

apt-get install qemu qemu-kvm\
	debootstrap

sudo debootstrap \
        --arch=arm64 \
        --verbose \
        --foreign \
        --components=main,restricted,universe,multiverse \
        --include=openssl,openssh-server,sudo \
        $1-lite \
        $1-lite-rootfs

cp /usr/bin/qemu-aarch64-static $1-lite-rootfs/usr/bin
cp pine64_update_kernel.sh $1-lite-rootfs/root/
cp pine64_update_uboot.sh $1-lite-rootfs/root/

chroot $1-lite-rootfs /bin/bash /debootstrap/debootstrap --second-stage

useradd -G adm,sudo -p $(openssl passwd -1 ubuntu) ubuntu

exit

cd $1-lite-rootfs
tar -cvf ../$1-lite-rootfs.tar