#!/bin/bash
# Install bare minimum before Ansible takes over
echo "Beginning installation, please wait!"
sudo apt update 
sudo apt install vim -y
sudo apt install resolvconf -y
sudo apt install exfat-fuse -y 
sudp apt install exfat-utils -y 
sudp apt install python3-distutils -y 
sudo apt install ansible -y 
# Install Alacritty and Reup the Config File 
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty
mkdir ~/.config/alacritty
pushd ~/.config/alacritty
curl -O https://raw.githubusercontent.com/Hexadecimalz/Linux-Setup/master/alacritty.yml 
popd

echo "Process complete"
