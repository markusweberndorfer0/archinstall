# Only UEFI

echo "exec \"setxkbmap -layout us,de\"" >> ~/.config/i3/config
echo "exec \"setxkbmap -option 'grp:alt_shift_toggle'\"" >> ~/.config/i3/config

# Delete installation scripts
sudo rm /root/install3.sh
rm ~/install4.sh
rm ~/install5.sh
