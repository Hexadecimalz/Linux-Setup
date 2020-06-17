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
# Download Vivaldi and Install How to get the latest? 
pushd ~/Downloads/
curl -O https://downloads.vivaldi.com/stable/vivaldi-stable_3.1.1929.34-1_amd64.deb
sudo dpkg -i vivaldi-stable_3.1.1929.34-1_amd64.deb
popd

# Victor Mono Font Install 
# https://www.unixtutorial.org/how-to-install-ttf-fonts-in-linux/
pushd ~/Downloads/
curl -O https://raw.githubusercontent.com/Hexadecimalz/Linux-Setup/master/VictorMonoAll-Font.zip
unzip VictorMonoAll-Font.zip
mkdir -p ~/.local/share/fonts 
cp TTF/*ttf ~/.local/share/fonts/
popd

# Install Alacritty and Reup the Config File 
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install alacritty
mkdir ~/.config/alacritty
pushd ~/.config/alacritty/
curl -O https://raw.githubusercontent.com/Hexadecimalz/Linux-Setup/master/alacritty.yml 
popd

# Install Joplin 
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash

# Copy vimrc file 
pushd ~/
curl -O https://raw.githubusercontent.com/Hexadecimalz/Linux-Setup/master/.vimrc
popd

echo "Process complete"
