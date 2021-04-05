#!/bin/bash



list=(
 #Core
    base-devel
    linux-headers
    intel-ucode  
    networkmanager
    network-manager-applet
    neovim
    git
    polkit
    tree
    reflector
    nvidia
    e2fsprogs
    btrfs-progs
    reiserfsprogs
    usbutils
    udisks2
    udiskie
    neofetch
    
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
    #i3-gaps
    #i3lock
    #i3block
    #rofi
    #papirus-icon-theme
    #nordic-theme-git
    #gtk-engine-murrine #for gtk theme
    #arc-gtk-theme
    
    qtile
    picom
    lxappearance-gtk3
    pcmanfm-gtk3
    feh
    file-roller
    htop
    arandr
    bash-completion
    kitty
    ranger
    python-pillow #image preview
    xclip
    mc

#Network
#-------
    avahi
    nss-mdns
    gvfs-smb

#Prints
#------
    cups
    cups-pdf
    ghostscript
    gsfonts
    gutenprint
    hplip
    gtk3-print-backends
    libcups
    system-config-printer

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
    ttf-iosevka-term
)

sudo git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si


for name in "${list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

for name in "${listyay[@]}" ; do
sudo yay -S --noconfirm --needed $name
done

sudo systemctl enable NetworkManager
sudo systemctl enable lightdm.service
sudo systemctl enable fstrim.timer
