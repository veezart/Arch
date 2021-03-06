#!/bin/bash

list=(
xorg
xorg-xinit
xterm
lightdm
lightdm-gtk-greeter lightdm-gtk-greeter-settings
i3-gaps
i3lock
i3block
rofi
picom
lxappearance
neofetch
)


for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

sudo systemctl enable lightdm.service
