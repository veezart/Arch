list=(
xorg
xorg-xinit
lightdm
lightdm-gtk-greeter lightdm-gtk-greeter-settings
i3-gaps
i3lock
i3block
rofi
picom
)


for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

sudo systemctl enable lightdm.service
