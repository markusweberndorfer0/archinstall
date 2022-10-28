# Only UEFI


# Customize packman
echo Color >> /etc/pacman.conf
echo ILoveCandy >> /etc/pacman.conf

# Set keyboard layout
exec setxkbmap -layout us,de
exec setxkbmap -option 'grp:alt_shift_toggle'

# Configure theme
sudo pacman -S lxappearance arc-gtk-theme papirus-icon-theme
sudo sed -i 's/#background=/background=#2f343f/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#theme-name=/theme-name=Arc-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#icon-theme-name=/icon-theme-name=Papirus-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#font-name=/font-name=Arial/' /etc/lightdm/lightdm-gtk-greeter.conf

# Assign i3lock to MOD + X
echo "# i3lock" >> ~/.config/i3/config
echo bindsym $mod+x exec i3lock >> ~/.config/i3/config

# Change standard console
sed -i 's/i3-sensible-terminal/termite/g' ~/.config/i3/config

# Configure audio

# Delete installation scripts
sudo rm /root/install2.sh
rm ~/install3.sh
rm ~/install4.sh

# Reboot
reboot