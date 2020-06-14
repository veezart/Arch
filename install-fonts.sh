#!/bin/bash
# Fira Code, Iosevka Slab, Iosevka Term
list=(
ttf-roboto

)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done
