#!/bin/bash

sudo pacman -S --noconfirm --needed git

sudo pacman -S gnome

git clone https://aur.archlinux.org/paru.git
cd paru
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
    profile-sync-daemon

#Fonts
#-----
    ttc-iosevka
    ttf-fira-code
    ttf-roboto
    ttf-ubuntu-font-family
    ttf-font-awesome
)

listparu=(

    #papirus-folders-git
    #ttf-inconsolata-g
    dracula-gtk-theme
    microsoft-edge-stable-bin
    profile-sync-daemon-edge
)



for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

for name in "${listparu[@]}" ; do
paru -S --noconfirm --needed $name
done

sudo systemctl enable gdm.service

#zsh configuration
zsh
z
touch ~/.zshrc
chsh -s /bin/zsh

