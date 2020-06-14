#!/bin/bash

list=(
gtk-engine-murrine
flameshot
imagemagick
xclip
mpv
youtube-dl
keepassxc
#xfce4-power-manager
)


for name in "${list[@]}" ; do
sudo pacman -S --needed $name
done
