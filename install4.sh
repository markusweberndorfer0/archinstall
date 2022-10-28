# Only UEFI


# Customize packman
echo Color >> /etc/pacman.conf
echo ILoveCandy >> /etc/pacman.conf

# Set keyboard layout
setxkbmap -layout de

# Configure theme
sudo pacman -S lxappearance arc-gtk-theme papirus-icon-theme
sudo sed -i 's/#background=/background=#2f343f/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#theme-name=/theme-name=Arc-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#icon-theme-name=/icon-theme-name=Papirus-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#font-name=/font-name=Arial/' /etc/lightdm/lightdm-gtk-greeter.conf

# Assign i3lock to MOD + X
echo "# i3lock" >> ~/.config/i3/config
echo "bindsym \$mod+x exec i3lock" >> ~/.config/i3/config

# Change standard console
sed -i 's/i3-sensible-terminal/termite/g' ~/.config/i3/config

# Configure audio
echo "# volctl" >> ~/.config/i3/config
echo "exec --no-startup-id volctl" >> ~/.config/i3/config

# Assign screen brightness controls
# HP Omen: https://forum.manjaro.org/t/no-brightness-control-on-nvidia-hp-omen/95329
echo "# Screen brightness controls" >> ~/.config/i3/config
echo "bindsym XF86MonBrightnessUp exec --no-startup-id xbacklight -inc 20" >> ~/.config/i3/config
echo "bindsym XF86MonBrightnessDown exec --no-startup-id xbacklight -dec 20" >> ~/.config/i3/config

# Assign media player controls
echo "# Media player controls" >> ~/.config/i3/config
echo "bindsym XF86AudioPlay exec --no-startup-id playerctl play" >> ~/.config/i3/config
echo "bindsym XF86AudioPause exec --no-startup-id playerctl pause" >> ~/.config/i3/config
echo "bindsym XF86AudioNext exec --no-startup-id playerctl next" >> ~/.config/i3/config
echo "bindsym XF86AudioPrev exec --no-startup-id playerctl previous" >> ~/.config/i3/config

# Delete installation scripts
sudo rm /root/install2.sh
rm ~/install3.sh
rm ~/install4.sh

# Reboot
reboot
