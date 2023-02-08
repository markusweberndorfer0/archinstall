# Only UEFI
# Login to created user

# Update user dirs
xdg-user-dirs-update

# Install yay package manager
mkdir ~/Sources
cd ~/Sources
git clone https://aur.archlinux.org/yay.git
cd ./yay
makepkg -si

# Manage bluetooth
sudo pacman -S bluez bluez-utils blueman --noconfirm
sudo systemctl enable bluetooth

# Improve battery consumption
sudo pacman -S tlp tlp-rdw powertop acpi --noconfirm
sudo systemctl enable tlp
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

# Enable SSD trim
sudo systemctl enable fstrim.timer

# Install i3-gaps
sudo pacman -S xorg-server xorg-apps xorg-xinit --noconfirm
sudo pacman -S i3-gaps i3blocks i3status numlockx --noconfirm
sudo pacman -S lightdm lightdm-gtk-greeter --needed --noconfirm
sudo systemctl enable lightdm

# Install fonts
sudo pacman -S noto-fonts ttf-ubuntu-font-family ttf-dejavu ttf-freefont --noconfirm
sudo pacman -S ttf-liberation ttf-droid ttf-roboto terminus-font ttf-font-awesome --noconfirm

# Install tools
sudo pacman -S rxvt-unicode ranger rofi dmenu --needed --noconfirm
sudo pacman -S pavucontrol-qt playerctl arandr --noconfirm
yay -Syu volctl --noconfirm
yay -S bumblebee-status i3lock-color --noconfirm

# Install software
sudo pacman -S firefox vlc --needed --noconfirm
sudo pacman -S terminator breeze-icons libreoffice --noconfirm
sudo pacman -S flameshot code krusader mupdf kdiff3 thunar --noconfirm
sudo pacman -S evolution evolution-ews --noconfirm
yay -S p7zip p7zip-gui --noconfirm
yay -S optimus-manager optimus-manager-qt --noconfirm
yay -S teamviewer spotify foxitreader --noconfirm
yay -S teams onedrivegui-git --noconfirm
systemctl enable optimus-manager

# Set LightDM keyboard layout
sudo bash -c "echo 'Section \"InputClass\"' >> /etc/X11/xorg.conf.d/20-keyboard.conf"
sudo bash -c "echo '    Identifier \"keyboard\"' >> /etc/X11/xorg.conf.d/20-keyboard.conf"
sudo bash -c "echo '    MatchIsKeyboard \"yes\"' >> /etc/X11/xorg.conf.d/20-keyboard.conf"
sudo bash -c "echo '    Option \"XkbLayout\" \"de\"' >> /etc/X11/xorg.conf.d/20-keyboard.conf"
sudo bash -c "echo '    Option \"XkbVariant\" \"nodeadkeys\"' >> /etc/X11/xorg.conf.d/20-keyboard.conf"
sudo bash -c "echo 'EndSection' >> /etc/X11/xorg.conf.d/20-keyboard.conf"

# Download next script
curl https://raw.githubusercontent.com/markusplayzz/archinstall/main/install4.sh -o ~/install4.sh

# reboot
sudo reboot
