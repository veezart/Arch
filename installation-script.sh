#!/bin/bash



list=(
# drivers

# display server

# display manager

# install sound


# windows manager

# coompositor

# apperance

# tools
xclip


mc

alacritty
flameshot

#xfce4-power-manager

# common

git

# multimedia
mpv
youtube-dl
)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

