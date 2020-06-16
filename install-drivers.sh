#!/bin/bash

list=(
# drivers
nvidia
intel-ucode
e2fsprogs
btrfs-progs
reiserfsprogs
usbutils
udisks2
udiskie
)


for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

