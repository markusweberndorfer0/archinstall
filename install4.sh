# Only UEFI


# Customize packman
echo Color >> /etc/pacman.conf
echo ILoveCandy >> /etc/pacman.conf

echo "exec \"setxkbmap -layout us,de\"" >> ~/.config/i3/config
echo "exec \"setxkbmap -option 'grp:alt_shift_toggle'\"" >> ~/.config/i3/config
exec setxkbmap -layout us,de
exec setxkbmap -option 'grp:alt_shift_toggle'
bindsym $mod+x exec i3lock

# Delete installation scripts
sudo rm /root/install2.sh
rm ~/install3.sh
rm ~/install4.sh
