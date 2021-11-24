#!/bin/bash

sudo pacman -S --noconfirm --needed git

sudo pacman -S gnome

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

list=(



# drivers
#--------
    nvidia

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
    zsh
    zsh-completions

#Fonts
#-----
    ttc-iosevka
    ttf-fira-code
    ttf-roboto
    ttf-ubuntu-font-family
    ttf-font-awesome
)

listyay=(

    #papirus-folders-git
    #ttf-inconsolata-g
    dracula-gtk-theme
    microsoft-edge-stable-bin
)



for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

for name in "${listyay[@]}" ; do
yay -S --noconfirm --needed $name
done

sudo systemctl enable gdm.service

#zsh configuration
zsh
z
touch ~/.zshrc
chsh -s /bin/zsh

