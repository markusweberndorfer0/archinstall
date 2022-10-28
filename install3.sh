# Only UEFI
# Login to created user
# su - markus

# Update user dirs
xdg-user-dirs-update

# Install yay package manager
mkdir ~/Sources
cd ~/Sources
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si

# Manage bluetooth
sudo pacman -S bluez bluez-utils blueman
sudo systemctl enable bluetooth

# Improve battery consumption
sudo pacman -S tlp tlp-rdw powertop acpi
sudo systemctl enable tlp
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# Enable SSD trim
sudo systemctl enable fstrim.timer

# Install i3-gaps
sudo pacman -S xorg-server xorg-apps xorg-xinit
sudo pacman -S i3-gaps i3blocks i3lock i3status numlockx
sudo pacman -S lightdm lightdm-gtk-greeter --needed
sudo systemctl enable lightdm

# Install fonts
sudo pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont
sudo pacman -S ttf-liberation ttf-droid ttf-roboto terminus-font

# Install tools
sudo pacman -S rxvt-unicode ranger rofi dmenu --needed
sudo pacman -S pavucontrol-qt playerctl
yay -Syu volctl

# Install software
sudo pacman -S firefox vlc --needed
yay -S termite

# Download next script
curl https://raw.githubusercontent.com/markusplayzz/archinstall/main/install4.sh -o ~/install4.sh

# reboot
sudo reboot
