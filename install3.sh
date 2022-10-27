# Only UEFI

# Create user "markus"
useradd -m -g users -G wheel,storage,power,audio markus
echo Set new users passswd
passwd markus

# Grant sudo rights to created user
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

# Login to created user
# su - markus
