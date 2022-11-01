# Only UEFI

# Set language
echo en_GB.UTF-8 UTF-8 >> /etc/locale.gen
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
pacman -Syu dhcpcd networkmanager network-manager-applet --noconfirm
systemctl enable dhcpcd
systemctl enable NetworkManager

# Install grub
pacman -S grub-efi-x86_64 efibootmgr --noconfirm
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch
grub-mkconfig -o /boot/grub/grub.cfg

# Set hostname and edit hosts file
echo ArchL > /etc/hostname
echo "127.0.0.1 localhost.localdomain   localhost" >> /etc/hosts
echo "::1       localhost.localdomain   localhost" >> /etc/hosts
echo "127.0.1.1 ArchL.localdomain       ArchL" >> /etc/hosts

# Install other packages
pacman -S iw wpa_supplicant dialog intel-ucode git reflector lshw unzip htop --noconfirm
pacman -S wget pulseaudio alsa-utils alsa-plugins pavucontrol xdg-user-dirs --noconfirm
reflector -c "AT" --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Install nvidia drivers
sudo pacman -S nvidia --noconfirm
# Blacklist "nouveau"
echo "blacklist nouveau" >> /usr/lib/modprobe.d/nvidia.conf

# Set new root passwd
echo Set new root passwd!
passwd

# Create user "markus"
useradd -m -g users -G wheel,storage,power,audio markus
echo Set new users passswd
passwd markus

# Grant sudo rights to created user
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Get next script
curl https://raw.githubusercontent.com/markusplayzz/archinstall/main/install3.sh -o /home/markus/install3.sh

# Initiate reboot
# exit
# reboot