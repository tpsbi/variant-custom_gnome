#!/bin/bash

usb=/dev/sda

fdisk $usb <<< $(printf "n\np\n\n\n\nw")

mkfs.ext4 -L persistence ${usb}3

mkdir -p /mnt/my_usb
mount ${usb}3 /mnt/my_usb
echo "/ union" | tee /mnt/my_usb/persistence.conf
umount ${usb}3
