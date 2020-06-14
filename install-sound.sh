#!/bin/bash

list=(
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
)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

echo "Done"
