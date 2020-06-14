#!/bin/bash

list=(
gtk-engine-murrine
flameshot
imagemagick
xclip
mpv
youtube-dl
mc
)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done
