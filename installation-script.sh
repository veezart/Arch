#!/bin/bash



list=(
# drivers

# display server

# display manager

# install sound


# windows manager

# coompositor

# apperance
lxappearance
neofetch
# tools
xclip

htop
mc
pcmanfm-gtk3
alacritty
flameshot
fille-roller
#xfce4-power-manager
polkit
# common
tree
git
reflector
# multimedia
mpv
youtube-dl
)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

sudo systemctl enable lightdm.service
sudo systemctl enable NetworkManager
