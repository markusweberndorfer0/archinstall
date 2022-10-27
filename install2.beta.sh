# Only UEFI

# Set language
echo en_GB.UTF-8 UTF-8 > /ect/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
echo LANGUAGE=en_GB >> /etc/locale.conf
echo LC_ALL=C >> /etc/locale.conf

# Set keyboard
echo KEYMAP=de-latin1 >> /etc/vconsole.conf

# Configure timezone
ln -sf /usr/share/zoneinfo/Europe/Vienna /etc/localtime
hwclock --systohc

# Packages
pacman -S dhcpcd networkmanager network-manager-applet
systemctl enable dhcpcd
systemctl enable NetworkManager

# Install grub
pacman -S grub-efi-x86_64 efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg

# Set hostname and edit hosts file
echo ArchL > /etc/hostname
echo "127.0.0.1 localhost.localdomain   localhost" >> /etc/hosts
echo "::1       localhost.localdomain   localhost" >> /etc/hosts
echo "127.0.1.1 ArchL.localdomain       ArchL" >> /etc/hosts

# Install other packages
pacman -S iw wpa_supplicant dialog intel-ucode git reflector lshw unzip htop
pacman -S wget pulseaudio alsa-utils alsa-plugins pavucontrol xdg-user-dirs
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Install nvidia drivers
sudo pacman -S nvidia nvidia-utils nvidia-settings

# Blacklist "nouveau"
echo "blacklist nouveau" >> /usr/lib/modprobe.d/nvidia.conf

# Set new root passwd
echo Set new root passwd!
passwd

# Initiate reboot
exit
umount -R /mnt
swapoff /dev/nvme0n1p2
reboot