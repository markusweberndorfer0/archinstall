# Only UEFI

# Customize packman
sudo sed -i 's/#Color/Color\nILoveCandy/' /etc/pacman.conf

# Set keyboard layout
sudo setxkbmap de
echo "# Set keymap" >> ~/.config/i3/config
echo "exec_always setxkbmap -layout de" >> ~/.config/i3/config

# Configure theme
sudo pacman -S lxappearance arc-gtk-theme materia-gtk-theme papirus-icon-theme
sudo sed -i 's/#background=/background=#2f343f/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#theme-name=/theme-name=Materia-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#icon-theme-name=/icon-theme-name=Papirus-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#font-name=/font-name=Arial/' /etc/lightdm/lightdm-gtk-greeter.conf

# Change i3-gaps font-family and size
sed -i 's/font pango:monospace 8/font pango:Ubuntu 11/' ~/.config/i3/config

# Configure workspaces
sed -i 's/set $ws1 "1"/set $ws1 "1: Terminal"/' ~/.config/i3/config
sed -i 's/set $ws2 "2"/set $ws2 "2: Firefox"/' ~/.config/i3/config
sed -i 's/set $ws3 "3"/set $ws3 "3: Code"/' ~/.config/i3/config
sed -i 's/set $ws4 "4"/set $ws4 "4: VirtualBox"/' ~/.config/i3/config

# Assign i3lock to MOD + X
echo "# i3lock" >> ~/.config/i3/config
echo "bindsym \$mod+x exec i3lock" >> ~/.config/i3/config

# Change standard console
sed -i 's/i3-sensible-terminal/termite/g' ~/.config/i3/config

# Configure audio
echo "# volctl" >> ~/.config/i3/config
echo "exec --no-startup-id volctl" >> ~/.config/i3/config

# Configure bluetooth
echo "# blueman-applet" >> ~/.config/i3/config
echo "exec --no-startup-id blueman-applet" >> ~/.config/i3/config

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

# Config i3-status
mkdir ~/.config/i3status
sudo cp /etc/i3status.conf ~/.config/i3status/i3status.conf
sudo chown markus:users ~/.config/i3status/i3status.conf
sed -i 's/status_command i3status/status_command i3status -c \/home\/markus\/.config\/i3status\/i3status.conf/' ~/.config/i3/config
sed -i 's/order += "ipv6"/#order += "ipv6"/' ~/.config/i3status/i3status.conf
sed -i 's/format_up = "W: (%quality at %essid) %ip"/format_up = " (%quality at %essid) %ip"/' ~/.config/i3status/i3status.conf
sed -i 's/format_down = "W: down"/format_down = " down"/' ~/.config/i3status/i3status.conf
sed -i 's/format_up = "E: %ip (%speed)"/format_up = " %ip (%speed)"/' ~/.config/i3status/i3status.conf
sed -i 's/format = "%status %percentage %remaining"/format = " %status %percentage %remaining"/' ~/.config/i3status/i3status.conf
sed -i 's/format = "%avail"/format = " %avail"/' ~/.config/i3status/i3status.conf
sed -i 's/format = "%1min"/format = " %1min"/' ~/.config/i3status/i3status.conf
sed -i 's/format = "%Y-%m-%d %H:%M:%S"/format = " %Y-%m-%d %H:%M:%S"/' ~/.config/i3status/i3status.conf

# Delete installation scripts
sudo rm /root/install2.sh
rm ~/install3.sh
rm ~/install4.sh

# Reboot
reboot
