#!/bin/bash



list=(
# drivers
nvidia
intel-ucode
btrfs-progs
reiserfsprogs
usbutils
networkmanager
# display server
xorg
xorg-xinit
# display manager
lightdm
lightdm-gtk-greeter lightdm-gtk-greeter-settings
# install sound
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
# windows manager
i3-gaps
i3lock
i3block
# coompositor
picom
# apperance
lxappearance
neofetch
# tools
xclip
rofi
htop
mc
pcmanfm-gtk3
alacritty
flameshot
fille-roller
xfce4-power-manager
polkit
# common
git
reflector
)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

sudo systemctl enable lightdm.service
sudo systemctl enable NetworkManager
