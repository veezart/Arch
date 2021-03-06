#!/bin/bash

#sudo pacman -S  --noconfirm --needed git

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

list=(
#VirtualBox
#----------
virtualbox-guest-utils
 
#Xorg
#-----
    xorg
    xorg-xinit
    xterm

#Desktop Manager
#---------------
    lightdm
    lightdm-gtk-greeter
    lightdm-gtk-greeter-settings

#Windows Manager / Desktop Environment / Compositor
#--------------------------------------------------
    i3-gaps
    i3lock
    #i3block
    rofi
    picom
    lxappearance-gtk3
    #papirus-icon-theme
    #nordic-theme-git
    #gtk-engine-murrine #for gtk theme
    #arc-gtk-theme
    neofetch

# drivers
#--------
    #nvidia
    intel-ucode
    #e2fsprogs
    #btrfs-progs
    #reiserfsprogs
    usbutils
    udisks2
    udiskie

#Sound
#-----
    pulseaudio
    pulseaudio-alsa
    pavucontrol
    alsa-firmware
    alsa-lib
    alsa-plugins
    alsa-utils
    gstreamer
    gst-plugins-good
    gst-plugins-bad
    gst-plugins-base
    gst-plugins-ugly
    playerctl
    volumeicon

#tools
#-----
    bash-completion
    neovim
    kitty
    ranger
    python-pillow #image preview
    xclip
    mc
    feh
    pcmanfm-gtk3
    file-roller
    polkit
    tree
    reflector
    htop
    arandr

#Network
#-------
    avahi
    nss-mdns
    gvfs-smb

#Prints
#------
    #cups
    #cups-pdf
    #ghostscript
    #gsfonts
    #gutenprint
    #hplip
    #gtk3-print-backends
    #libcups
    #system-config-printer

#Apps
#-----
    #flameshot
    #imagemagick
    mpv
    youtube-dl
    keepassxc
    zathura
    #xfce4-power-manager

#Fonts
#-----
    ttf-fira-code
    ttf-dejavu
    ttf-roboto
    ttf-ubuntu-font-family
    ttf-inconsolata
    ttf-hack
    ttf-opensans
    inter-font
    ttf-cascadia-code
    ttf-font-awesome
)

listyay=(

    #papirus-folders-git
    #ttf-inconsolata-g
    ttf-iosevka
)



for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

for name in "${listyay[@]}" ; do
yay -S --noconfirm --needed $name
done

sudo systemctl enable lightdm.service

sudo systemctl enable vboxservice.service
VBoxClient --clipboard
VBoxClient --draganddrop
VBoxClient --seamless
VBoxClient --checkhostversion
VBoxClient --vmsvga
