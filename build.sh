#!/bin/bash

set -ex

apt-get install qemu qemu-kvm\
	debootstrap

sudo debootstrap \
        --arch=arm64 \
        --verbose \
        --foreign \
        --components=main,restricted,universe,multiverse \
        --include=docker.io,curl,zsh,git,git-core,openssl,openssh-server,sudo \
        $1 \
        $1-rootfs

cp /usr/bin/qemu-aarch64-static $1-rootfs/usr/bin

cp pine64_update_kernel.sh $1-rootfs/root/
cp pine64_update_uboot.sh $1-rootfs/root/
cp resize_rootfs.sh $1-rootfs/root/

chroot $1-rootfs /bin/bash /debootstrap/debootstrap --second-stage

exit

cd $1-rootfs
tar -cvf ../$1-rootfs.tar