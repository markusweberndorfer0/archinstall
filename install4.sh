# Only UEFI

# Customize packman
sudo sed -i 's/#Color/Color\nILoveCandy/' /etc/pacman.conf

# Add params to grub conf
sudo sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet video.use_native_backlight=1 acpi_backlight=video"/' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

# Configure theme
sudo pacman -S lxappearance materia-gtk-theme papirus-icon-theme
sudo sed -i 's/#background=/background=#2f343f/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#theme-name=/theme-name=Materia/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#icon-theme-name=/icon-theme-name=Papirus-Dark/' /etc/lightdm/lightdm-gtk-greeter.conf
sudo sed -i 's/#font-name=/font-name=Ubuntu 11/' /etc/lightdm/lightdm-gtk-greeter.conf

# Set keyboard layout
sudo setxkbmap de
echo "# Set keymap" >> ~/.config/i3/config
echo "exec_always setxkbmap -layout de" >> ~/.config/i3/config

# Change i3-gaps font-family and size
sed -i 's/font pango:monospace 8/font pango:Ubuntu 11/' ~/.config/i3/config

# Configure workspaces
sed -i 's/set $ws1 "1"/set $ws1 "1: Terminal"/' ~/.config/i3/config
sed -i 's/set $ws2 "2"/set $ws2 "2: Firefox"/' ~/.config/i3/config
sed -i 's/set $ws3 "3"/set $ws3 "3: Code"/' ~/.config/i3/config
sed -i 's/set $ws4 "4"/set $ws4 "4: VirtualBox"/' ~/.config/i3/config

# i3lock config
echo "# i3lock" >> ~/.config/i3/config
mkdir ~/.config/i3lock
curl https://raw.githubusercontent.com/markusplayzz/archinstall/main/i3lockconfig -o ~/.config/i3lock/i3lockconfig
sudo chown markus:users ~/.config/i3lock/i3lockconfig
echo "bindsym \$mod+x exec sh /home/markus/.config/i3lock/i3lockconfig" >> ~/.config/i3/config

# Change standard console
sed -i 's/i3-sensible-terminal/terminator/g' ~/.config/i3/config

# Change dmenu to rofi
sed -i 's/bindsym $mod+d exec --no-startup-id dmenu/bindsym $mod+d exec --no-startup-id rofi -theme android_notification -show run/'

# Configure audio
echo "# volctl" >> ~/.config/i3/config
echo "exec --no-startup-id volctl" >> ~/.config/i3/config

# Configure optimus-manager
echo "# optimus-manager-qt" >> ~/.config/i3/config
echo "exec_always optimus-manager-qt" >> ~/.config/i3/config

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

# Config bumblebee
sed -i 's/status_command i3status/status_command bumblebee-status -m time cpu memory battery nic pulseout xrandr -p pulseout.right-click="pavucontrol" xrandr.right-click="arandr" -t solarized-powerline\n        position top/' ~/.config/i3/config

# Change color themes
sed -i 's/bindsym $mod+r mode "resize"/bindsym $mod+r mode "resize"\n\n# Color palette\nset $bgcolor    #598392\nset $ibgcolor   #124559\nset $textcolor    #ffffff\nset $ubgcolor  #ff0000\nset $indicator #124559/' ~/.config/i3/config
echo "# BGColors" >> ~/.config/i3/config
echo "#                         border      background          text        indicator" >> ~/.config/i3/config
echo "client.focused            \$bgcolor    \$bgcolor            \$textcolor  \$indicator" >> ~/.config/i3/config
echo "client.unfocused          \$ibgcolor   \$ibgcolor           \$textcolor  \$indicator" >> ~/.config/i3/config
echo "client.focused_inactive   \$ibgcolor   \$ibgcolor           \$textcolor  \$indicator" >> ~/.config/i3/config
echo "client.urgent             \$ubgcolor   \$ubgcolor           \$textcolor  \$indicator" >> ~/.config/i3/config
sed -i 's/position top/position top\n    colors{\n        background $bgcolor\n        separator $indicator\n        #   border  background  text\n        focused_workspace   $bgcolor    $bgcolor    $textcolor\n        inactive_workspace  $ibgcolor   $ibgcolor   %textcolor\n        urgent_workspace    $ubgcolor   $ubgcolor   $textcolor\n}/' ~/.config/i3/config

# Window gaps
echo "# Window gaps" >> ~/.config/i3/config
echo "for_window [class=\"^.*\"] border pixel 2" >> ~/.config/i3/config
echo "gaps inner 10" >> ~/.config/i3/config
echo "gaps outer 5" >> ~/.config/i3/config

# Move workspaces between monitors
echo "# Move workspaces between monitors" >> ~/.config/i3/config
echo "bindsym \$mod+Control+Right move workspace to output right" >> ~/.config/i3/config
echo "bindsym \$mod+Control+Left move workspace to output left" >> ~/.config/i3/config
echo "bindsym \$mod+Control+Up move workspace to output up" >> ~/.config/i3/config
echo "bindsym \$mod+Control+Down move workspace to output down" >> ~/.config/i3/config

# Switch gpu profile
echo "# Switch gpu profile" >> ~/.config/i3/config
echo "exec_always optimus-manager --switch hybrid" >> ~/.config/i3/config

# Place second monitor right
# echo "# Set second monitor's place" >> ~/.config/i3/config
# echo "xrandr --output HDMI-1-0 --right-of eDP-1" >> ~/.config/i3/config

# Screenshot config
echo "# Screenshot config" >> ~/.config/i3/config
mkdir ~/Pictures/screenshots
echo "bindsym Print exec flameshot full -p ~/Pictures/screenshots" >> ~/.config/i3/config
echo "bindsym \$mod+Shift+S exec flameshot gui -p ~/Pictures/screenshots" >> ~/.config/i3/config

# Delete installation scripts
sudo rm /install2.sh
rm ~/install3.sh
rm ~/install4.sh

# Reboot
reboot