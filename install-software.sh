#!/bin/bash

list=(
gtk-engine-murrine
flameshot
imagemagick

)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done
