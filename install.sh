#!/bin/bash

#check for the correct OS before proceeding 
if grep -q UBUNTU /etc/os-release
then
        echo "Initiating Installations..."
else
        exit 2
fi

#just a silly function print some water
function waterfall() {
        count="30"
        while [ $count -gt 0 ] ; do
                line+="*"
                echo "$line"
                count=$((count-1))
        done
        echo -e  "$line\n"
}

function apt-fall() {
# Install bare minimum before Ansible takes over
echo "Beginning the Apt Waterfall, please wait!"
sudo apt update -y  && sudo apt upgrade -y 
wait 
sudo apt install curl vim resolvconf exfat-fuse exfat-utils python3-distutils ansible preload fail2ban -y
wait
# Install Joplin 
wget -O - https://raw.githubusercontent.com/laurent22/joplin/master/Joplin_install_and_update.sh | bash
wait
#sudo apt install vivaldi-stable -y
# Download Vivaldi and Install How to get the latest? 
# pushd ~/Downloads/
# curl -O https://downloads.vivaldi.com/stable/vivaldi-stable_3.1.1929.34-1_amd64.deb
# sudo dpkg -i vivaldi-stable_3.1.1929.34-1_amd64.deb
# popd
waterfall
}

function font-install() {
echo "Attempting to install fonts"
# Victor Mono Font Install 
# https://www.unixtutorial.org/how-to-install-ttf-fonts-in-linux/
pushd ~/Downloads/ || exit
curl -O https://raw.githubusercontent.com/Hexadecimalz/Linux-Setup/master/VictorMonoAll-Font.zip
wait
unzip VictorMonoAll-Font.zip
wait
mkdir -p ~/.local/share/fonts 
cp TTF/*ttf ~/.local/share/fonts/
popd || exit
}

function alacritty-setup (){
# Install Alacritty and Reup the Config File 
sudo add-apt-repository ppa:mmstick76/alacritty
wait
sudo apt install alacritty -y 
wait
mkdir -p  ~/.config/alacritty
pushd ~/.config/alacritty/ || exit
curl -O https://raw.githubusercontent.com/Hexadecimalz/Linux-Setup/master/alacritty.yml
wait
popd || exit
}

function basic-settings() {
# Improve startup https://www.linux.com/topic/desktop/cleaning-your-linux-startup-process/ 

# Copy vimrc file 
pushd ~/ || exit
curl -O https://raw.githubusercontent.com/Hexadecimalz/Linux-Setup/master/.vimrc
wait
popd || exit

# No more Apport
sudo apt purge apport -y
wait
sudo systemctl stop whoopsie.service
wait
sudo systemctl disable whoopsie.service
wait

# No need for daily update
sudo systemctl disable apt-daily.service
wait
sudo systemctl disable apt-daily.timer
wait
sudo systemctl disable apt-daily-upgrade.timer
wait
sudo systemctl disable apt-daily-upgrade.service
wait

#Install KDE 
sudo apt install kde-full -y 
wait

# Disable KDE Wallet
kwriteconfig5 --file kwalletrc --group 'Wallet' --key 'Enabled' 'false'
wait
kwriteconfig5 --file kwalletrc --group 'Wallet' --key 'First Use' 'false'
wait
}

# Run the functions 
apt-fall
clear
font-install
alacritty-setup
basic-settings

waterfall
echo "Process complete"
exit 0 
