#!/bin/bash

list=(
ttf-roboto

)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done
