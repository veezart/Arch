#!/bin/bash

list=(
gtk-engine-murrine
flameshot
imagemagick
xclip
mpv
youtube-dl
mc
keepassxc
#xfce4-power-manager
)


for name in "${list[@]}" ; do
sudo pacman -S --needed $name
done
