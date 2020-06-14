#!/bin/bash

list=(
# drivers
nvidia
intel-ucode
e2fsprogs
btrfs-progs
reiserfsprogs
usbutils
networkmanager
)


for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

sudo systemctl enable NetworkManager
