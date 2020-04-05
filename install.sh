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
echo "Process complete"
