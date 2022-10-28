# Only UEFI

echo "exec \"setxkbmap -layout us,de\"" >> ~/.config/i3/config
echo "exec \"setxkbmap -option 'grp:alt_shift_toggle'\"" >> ~/.config/i3/config
exec setxkbmap -layout us,de
exec setxkbmap -option 'grp:alt_shift_toggle'

# Delete installation scripts
sudo rm /root/install2.sh
rm ~/install3.sh
rm ~/install4.sh
