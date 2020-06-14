list=(
avahi
nss-mdns
gvfs-smb
)

for name in "{list[@]}" ; do
sudo pacman -S --noconfirm --needed $name
done

#hosts: files mymachines myhostname resolve [!UNAVAIL=return] dns
#ArcoLinux line
#hosts: files mymachines resolve [!UNAVAIL=return] mdns dns wins myhostname

#first part
sudo sed -i 's/files mymachines myhostname/files mymachines/g' /etc/nsswitch.conf
#last part
sudo sed -i 's/\[\!UNAVAIL=return\] dns/\[\!UNAVAIL=return\] mdns dns wins myhostname/g' /etc/nsswitch.conf

sudo systemctl enable avahi-daemon.service



echo "Done"
