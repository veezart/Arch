#!/bin/bash

list=(
gtk-engine-murrine
flameshot
imagemagick
xclip
mpv
youtube-dl
keepassxc
zathura
#xfce4-power-manager
)


for name in "${list[@]}" ; do
sudo pacman -S --needed $name
done
