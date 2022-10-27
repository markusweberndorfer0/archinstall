# Only UEFI
################# Load Keyboard #################
# loadkeys de-latin1
################# Format Partitions before running! #################
# gdisk /dev/nvme0n1
# o - y
# n - Enter - Enter - +512M - EF00
# n - Enter - Enter - +8G - 8200
# n - Enter - Enter - +50G - 8304
# n - Enter - Enter - +100G - 8302
# w - y

# Get best package mirrors
pacman -Sy
pacman -S reflector
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Format disks
mkfs.fat -F32 /dev/nvme0n1p1
mkswap /dev/nvme0n1p2
mkfs.ext4 /dev/nvme0n1p3
mkfs.ext4 /dev/nvme0n1p4

# Mount parts

swapon /dev/nvme0n1p2
mount /dev/nvme0n1p3 /mnt
mkdir /mnt/{boot,home}
mount /dev/nvme0n1p1 /mnt/boot
mount /dev/nvme0n1p4 /mnt/home

# Installation
timedatectl set-ntp true
pacstrap /mnt base base-devel linux linux-firmware vi vim nano
genfstab -U /mnt >> /mnt/etc/fstab

# Enter new system
arch-chroot /mnt

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
