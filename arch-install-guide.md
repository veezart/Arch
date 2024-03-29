# Arch Linux Installation Guide
-----------------------------

### Usefull links:
--------------

Official site:
https://www.archlinux.org

Download link:
https://www.archlinux.org/download/

Instalation guide:
https://wiki.archlinux.org/index.php/Installation_guide

Packages installation script:
https://github.com/veezart/Arch/blob/master/installation-script.sh

#### Checksums:

Checksums check with PowerShell:

```(Get-FileHash path/to/file.iso -Algorithm SHA1).Hash.ToUpper() -eq "SHA1 checksum".ToUpper()```

```(Get-FileHash path/to/file.iso -Algorithm MD5).Hash.ToUpper() -eq "MD5 checksum".ToUpper()```

### Create bootable USB flash drive:
--------------------------------
    
Use app:
Rufus https://rufus.ie/

Ventoy https://www.ventoy.net

## I Core installation
----------------------
                                                                             
### Set the keyboard layout:
------------------------    
```$loadkeys pl```

### Verify the boot mode:
---------------------
```>$ ls /sys/firmware/efi/efivars```

### Connect to the internet:
----------------------------
```
$ ip link
$ ping archlinux.org
```
### Update the system clock:
----------------------------
```
# timedatectl set-ntp true
# timedatectl status
```

### Partition the disks:
--------------------
##### Actually need partitions:
```
-----------------------------------------------------------------------------------
SDD /dev/sda4  /mnt/boot  | fat32    | 512M |   EFI | $ mkfs.fat -F32  /dev/sda4 |
-----------------------------------------------------------------------------------
SDD /dev/sda5  /mnt       | btrfs    |  39G | linux | $ mkfs.btrfs     /dev/sda5 |
-----------------------------------------------------------------------------------
HDD /dev/sdb1  /mnt/swap  | swap     | 4GBM |  swap | $ mkswap         /dev/sdb1 |
-----------------------------------------------------------------------------------
HDD /dev/sdb2  /mnt/home  | ext4     |  32G | linux | $ mkfs.ext4      /dev/sdb2 |
-----------------------------------------------------------------------------------
HDD /dev/sdb3  /mnt/var   | reiserfs |   8G | linux | $ mkfs.reiserfs  /dev/sdb3 |
-----------------------------------------------------------------------------------
```
###### To identify these devices, use lsblk or fdisk
```
$ fdisk -l
$ lsblk
```
### Make partitions (efi 260 - 512MB)

```$ cfdisk /dev/sdx  (x=a,b,c…)```
```
/boot
/
/swap
/home
/var    (8-12G)
```    
### Format partitions
 
#### boot (efi):
```$ mkfs.fat -F32 /dev/sdxy``` (fat32 for systemd boot manager)
#### swap:
```
$ mkswap /dev/sdxy 
$ swapon /dev/sdxy
```
#### Linux partitions:
```
$ mkfs.ext4 /dev/sdxy
$ mkfs.btrfs  /dev/sdxy   (/)
$ mkfs.reiserfs  /dev/sdxy  (/var)
```

### Mount partitions:
-----------------    
```
$ mount /dev/sdxy /mnt           (root)
    
$ mkdir -p /mnt/boot             (or efi)
$ mount /dev/sdxy   /mnt/boot    (or efi, efi partition)

$ mkdir /mnt/home 
$ mount /dev/sdxy /mnt/home
$ mkdir /mnt/var
$ mount /dev/sdxy /mnt/var
```

### Instalation:
------------
#### Select the mirrors

##### Edit

```$ reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist```

```$ vim /etc/pacman.d/mirrorlist (sort top 5 by closest localization)```
##### Install

```$ pacstrap /mnt base base-devel linux linux-firmware linux-headers intel-ucode (for intel CPU) nerworkmanager tree vim micro ```

### Fstab
-----
```$ genfstab -U /mnt >> /mnt/etc/fstab```
        
Check the resulting */mnt/etc/fstab* file, and edit it in case of errors.

### Chroot
------
#### Change root into the new system:

```$ arch-chroot /mnt```
                                                                      
### Time zone
---------    
#### Set the time zone:

```$ ln -sf /usr/share/zoneinfo/Region/City /etc/localtime```
    
#### Run hwclock to generate /etc/adjtime:

```$ hwclock --systohc --utc```

### Localization
------------
```$ micro /etc/locale.gen```
```
delete $ at:   
en_US.UTF-8 
pl_PL.UTF-8
```
###### and save 
```    
$ locale-gen 
$ echo LANG=pl_PL.UTF-8 > /etc/locale.conf 
$ micro /etc/vconsole.conf 
```     
```
        KEYMAP=pl 
        FONT=Lat2-Terminus16 
        FONT_MAP=8859-2
```
### Host
----
```
    $ echo nazwahosta > /etc/hostname 
    $ micro /etc/hosts

        127.0.0.1     localhost 
        ::1           localhost 
        127.0.1.1     nazwahosta.localdomain   nazwahosta
```
### Network
-------
```$ systemctl enable NetworkManager```

### Root password
-------------
#### Set the root password:
```$ passwd```

### Boot loader
-----------
``` 
$ bootctl --path=/boot$esp install
$ tree /boot
```
``` bash
/boot
├── EFI
│   ├── Boot
│   │   └── BOOTX64.EFI
│   └── systemd
│       └── systemd-bootx64.efi
├── initramfs-linux-fallback.img
├── initramfs-linux.img
├── loader
│   ├── entries
│   │   └── arch.conf
│   └── loader.conf
└── vmlinuz-linux
```

```$ micro /boot/loader/loader.conf```
```
default arch
timeout 5
editor 0
```
```$ micro /boot/loader/entries/arch.conf```
```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img  
initrd  /initramfs-linux.img
options root=PARTUUID=66e3f67d-f59a-4086-acdd-a6e248a3ee80 rw 
```
(or *options root=/dev/nvme0n1p3 rw intel_iommu=on*)

#### To find PARTUUID in Vim: 
```:r! blkid -s PARTUUID -o value /dev/sdxy``` (Arch root partition)

to select press v-start, y-copy, d-cut, P,p-paste
```
$ bootctl status
$ bootctl list
$ bootctl --path=/boot update
```    
### Reboot
------
```
$ exit 
$ umount -a 
$ reboot
```
### Multilib repository
-------------------
```$ micro /etc/pacman.conf``` 
delete $ at: 
```
[multilib] 
include = /etc/pacman.d/mirrorlist
Color   
```       
##### and ad:           
```ILoveCandy```
```
$ pacman -Syu
```
### Personal account
----------------
```
$ useradd -m -G audio,video,network,wheel,storage,rfkill -s /bin/bash (oz zsh) username 
$ passwd username 
``` 
```$ EDITOR=micro visudo```

##### delete $ at:   
```%wheel ALL=(ALL) ALL``` 
```$ exit```

### Login new user
--------------
    ***

### Enable periodic TRIM for SSD
----------------------------

#### Check status:
    
```$ systemctl status fstrim.service```
    
#### Enable:
    
```$ sudo systemctl enable fstrim.timer```
    
#### Verify:

```$ sudo systemctl list-timers --all```

#### Disable:

```$ sudo systemctl disable fstrim.timer```


## II Instalation display server manager and drivers          
                                                              
### Display server
--------------
```
$ sudo pacman -S xorg xorg-xinit xterm
$ startx 
$ exit
```
### Xorg localization
---------------------
```$ localectl --no-convert set-x11-keymap pl```

### Graphic drivers
---------------
```$ lspci | grep -e VGA```

##### if necesery
```
$ sudo pacman -S xf86-video
$ sudo pacman -S nvidia 
```
### Display manager
---------------
```
$ sudo pacman -S lightdm 
$ sudo pacman -S lightdm-gtk-greeter lightdm-gtk-greeter-settings 
$ sudo systemctl enable lightdm.service
```
### Instalation windows manager                    
---------------------------                                                              

#### i3
```
$ sudo pacman -S i3-gaps 
$ sudo pacman -S rofi
$ sudo pacman -S picom 
$ sudo pacman -S polkit 
$ sudo pacman -S lxappearance
$ sudo pacman -S flameshot
$ sudo pacman -S ttf-roboto
```
##### i3 config file *~/i3/config*
```
$ Media player controls
bindsym XF86AudioPlay exec playerctl play
bindsym XF86AudioPause exec playerctl pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous
```
```
$ Volume icon tray
exec --no-startup-id volumeico

$ Wallpaper
exec_always feh --bg-scale /path/to/image

$ Assign application to workspace. Class can find by enter xprop in terminal and pick application windowSS.
assign [class="window_class"] $ws1
```
    
###### Fonts:

```$ fc-list : family style```
*~/i3/config*

###### use *lxappearance* 
*~/.gtkrc-2.0*
*~/.config/gtk-3.0*

###### Font Awesome:

https://github.com/FortAwesome/Font-Awesome/releases
https://fontawesome.com/cheatsheet?from=io
```
$ unzip Font-Awesome-X.X.X.zip  
$ mkdit ~/.fonts
$ mv fontawesome-webfont.ttf ~/.fonts
```
###### Colors:
```
    # Colors:
    set $bg-color 	     $2f343f
    set $inactive-bg-color   $2f343f
    set $text-color          $f3f4f5
    set $inactive-text-color $676E7D
    set $urgent-bg-color     $E53935

    $ window colors
    $                       border              background         text                 indicator
    client.focused          $bg-color           $bg-color          $text-color          $00ff00
    client.unfocused        $inactive-bg-color  $inactive-bg-color $inactive-text-color $00ff00
    client.focused_inactive $inactive-bg-color  $inactive-bg-color $inactive-text-color $00ff00
    client.urgent           $urgent-bg-color    $urgent-bg-color   $text-color          $00ff00
```
```
    $ bar
    bar {
  	status_command i3blocks -c /home/booker/.i3/i3blocks.conf
	colors {
		background $bg-color
	    	separator $757575
		    $                  border             background         text
		    focused_workspace  $bg-color          $bg-color          $text-color
		    $inactive-bg-color $inactive-bg-color $inactive-text-color
		    urgent_workspace   $urgent-bg-color   $urgent-bg-color   $text-color
	        }
```
#### Huion tablet driver
-------------------

```$ sudo pacman -S usbutils```

```$ lsusb```

```$ micro /etc/X11/xorg.conf.d/50-tablet.conf``` 
```
        Section "InputClass"
            Identifier "Tablet"
            Driver "wacom"
            MatchDevicePath "/dev/input/event*"
            MatchUSBID "<VID>:<PID>"
        EndSection
```
```
        :r! lsusb

            Bus 001 Device 003: ID 256c:006d HUION Huion Tablet

            "<VID>:<PID>" is it ID "256c:006d"
```
```
    $ xsetwacom list

        HUION Huion Tablet Pad pad                   id: 9   type: PAD
        HUION Huion Tablet Pen stylus                id: 10  type: STYLUS
```
###### You can assign key combination to the buttons:

```$ xsetwacom set "HUION Huion Tablet Pad pad" button 9 key Ctrl Z```
        
###### key are numbered from top 1, 2, 3, 8, 9, 10 and on

```$ xsetwacom set "HUION Huion Tablet Pen stylus" button 2 key Ctrl Z```

###### buttons pen key are numbered 1 (tip), 2, 3

###### Reset button:

```$ xsetwacom set 'HUION Huion Tablet Pen stylus' Button 1 "button +1"```

###### You can restrict the tablet input to that display like this:
```
$ xrandr
        
HDMI-3 connected 1440x900+0+0 (normal left inverted right x axis y axis) 408mm x 255mm    
            
$ xsetwacom set "HUION Huion Tablet Pen stylus" MapToOutput HDMI-0
or
$ xinput set-prop "HUION Huion Tablet Pen stylus" HDMI-0
```



