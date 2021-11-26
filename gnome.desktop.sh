#!/bin/bash

sudo pacman -S gnome
sudo pacman -S --noconfirm --needed git
#Paru Aur Helper----------------------------
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
############################################
##---PACKAGES-----PACKAGES-----PACKAGES---##
############################################

#>>>>>>>>PACMAN<<<<<<<<
list=(

    # drivers
    #--------
    nvidia
    broadcom-wl

    #tools
    #-----
    bash-completions
    feh
    keepassxc
    kitty
    mpv
    neofetch
    reflector
    tree
    youtube-dl
    curl
    zsh
    zsh-completions
    powerline
    powerline-fonts
    #profile-sync-daemon

    #Fonts
    #-----
    ttf-iosevka
    ttf-fira-code
    #ttf-roboto
    #ttf-ubuntu-font-family
    #ttf-font-awesome
)
#>>>>>>>>>>AUR<<<<<<<<<<

listparu=(

    microsoft-edge-stable-bin
)
############################################

#:::::::::::::::::::::::::::::::::::::::::::
for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

for name in "${listparu[@]}" ; do
paru -S --noconfirm --needed $name
done
#:::::::::::::::::::::::::::::::::::::::::::

#++++++++++++++ SERVICES ++++++++++++++
sudo systemctl enable gdm.service
#++++++++++++++++++++++++++++++++++++++

#--#--#--#--#--#--#--#--#--#--#
#       CONFIGURATIONS        #
#--#--#--#--#--#--#--#--#--#--#

#=============zsh==============
zsh
z
touch ~/.zshrc
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "powerline-daemon -q" ~/.zshrc
echo ". /usr/share/powerline/bindings/zsh/powerline.zsh" ~/.zshrc
#============kitty=============

#==========youtube-dl==========

#=============mpv==============

#--#--#--#--#--#--#--#--#--#--#


