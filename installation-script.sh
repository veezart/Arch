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



#xfce4-power-manager

# common

# multimedia

)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

