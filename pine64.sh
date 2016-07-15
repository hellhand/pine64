#!/bin/bash

set -ex

#sudo umount -f /mnt/bootenv
#sudo umount -f /mnt

curl -sSL https://www.stdin.xyz/downloads/people/longsleep/pine64-images/simpleimage-pine64-latest.img.xz | unxz | sudo dd of=/dev/mmcblk0 bs=1M

/bin/echo -e "d\n2\nn\np\n2\n143360\n\nw\n" | sudo fdisk /dev/mmcblk0

sudo mkfs.ext4 -F -b 4096 -L rootfs /dev/mmcblk0p2

sudo rm -Rf /mnt

sudo mkdir /mnt
sudo mount /dev/mmcblk0p2 /mnt

sudo mkdir /mnt/bootenv
sudo mount /dev/mmcblk0p1 /mnt/bootenv

sudo tar --numeric-owner -C /mnt -xvf $1

sudo umount /mnt/bootenv
sudo umount /mnt

sync; sync
