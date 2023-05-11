#!/bin/bash

echo ''
echo ''
echo '██████╗  ██████╗ ██╗   ██╗███╗   ██╗██████╗ ██████╗ ██████╗'
echo '██╔══██╗██╔═══██╗██║   ██║████╗  ██║██╔══██╗╚════██╗██╔══██╗'
echo '██████╔╝██║   ██║██║   ██║██╔██╗ ██║██║  ██║ █████╔╝██████╔╝'
echo '██╔══██╗██║   ██║██║   ██║██║╚██╗██║██║  ██║ ╚═══██╗██╔══██╗'
echo '██████╔╝╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝██████╔╝██║  ██║'
echo '╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═════╝ ╚═╝  ╚═╝'
echo ''
echo ''

# Goal: Script which automatically sets up a new Ubuntu based Machine after installation
# This is a basic install, easily configurable to your needs
# Note!: Currently supports only Ubuntu 22.04 LTS

echo "Welcome! Let's start setting up your system. It could take more than 10 minutes, be patient"

# Test to see if user is running with root privileges.
if [[ '${UID}' -ne 0 ]]; then
    echo 'Must execute with sudo or root' >&2
    exit 1
fi

echo ''
echo '##########'
echo 'Updating repository information...'
echo 'Requires root privileges:'
sudo apt update -y
sudo apt upgrade -y
# Dist-Upgrade
echo 'Performing system upgrade...'
sudo add-apt-repository universe
sudo add-apt-repository multiverse -y
sudo add-apt-repository ppa:eugenesan/ppa -y
sudo apt-get install synaptic -y
sudo apt dist-upgrade -y
echo 'Done.'

echo ''
echo '##########'
echo 'SO essentials'
echo ''
echo '>>> Installing libs'
sudo apt install libxss1 libappindicator1 libindicator7 -y
echo '>>> Install Multimedia Codecs'
sudo apt-get install Ubuntu-restricted-extras
echo '>>> Enable Firewall'
sudo ufw enable
sudo apt-get install gufw -y
echo '>>> Installing Flatpak'
sudo apt-get install flatpak -y
sudo apt-get install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub-org/repo/flathub.flatpakrepo
echo 'Done.'

echo ''
echo '##########'
echo 'Customize system'
echo ''
echo '>>> Installing gnome-tweak-tool'
sudo apt install gnome-tweaks -y
sudo apt install gnome-shell-extension-manager -y
echo '>>> Installing gnome sushi'
sudo apt-get install gnome-sushi
echo 'Done.'

echo ''
echo '##########'
echo 'Installing essentials development...'
echo ''
echo '>>> Installing git'
sudo apt install git -y
echo '>>> Installing jdk'
sudo apt install default-jdk -y
java -version
echo '>>> Installing python3'
sudo apt-get install python3
echo '>>> Installing python3-pip'
sudo apt-get install python3-pip -y
echo '>>> Installing nodejs'
sudo apt install nodejs -y
echo '>>> Installing npm'
sudo apt install npm -y
echo '>>> Installing yarn'
sudo npm install --global yarn -y
echo '>>> Installing expo'
sudo npm install -g expo-cli -y
echo 'Done.'

echo ''
echo '##########'
echo 'Installing applications for development...'
echo ''
echo '>>> Installing vscode'
flatpak install flathub com.visualstudio.code -y
echo '>>> Installing smartgit'
sudo apt install smartgit -y
sudo apt install smartgithg -y
echo '>>> Installing htop'
sudo apt install htop
echo '>>> Installing scrcpy'
flatpak install flathub in.srev.guiscrcpy -y
echo 'Done.'

echo ''
echo '##########'
echo 'Installing selected favourite applications...'
echo '>>> Installing Google Chrome'
flatpak install flathub com.google.Chrome
echo '>>> Installing libreOffice'
flatpak install flathub org.libreoffice.LibreOffice
echo '>>> Installing spotify'
flatpak install flathub com.spotify.Client
echo '>>> Installing gimp'
flatpak install flathub org.gimp.GIMP
echo '>>> Installing inkscape'
flatpak install flathub org.inkscape.Inkscape
echo '>>> Installing simplescreenrecorder'
sudo apt-get install simplescreenrecorder
echo '>>> Installing steam'
sudo apt install steam -y
sudo apt install wine -y
echo 'Done.'

echo ''
echo '##########'
echo 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
clear
echo 'Done.'

echo ''
echo '##########'
echo 'What name do you want to use in GIT user.name?'
echo 'For example, mine will be \'John Doe\'
read git_config_user_name

echo 'What email do you want to use in GIT user.email?'
echo 'For example, mine will be \'example@mail.com\'
read git_config_user_email

echo 'Setting up your git global user name and email'
git config --global user.name '$git_config_user_name'
git config --global user.email $git_config_user_email
echo 'Done.'

echo '>>> Configure system style'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
gsettings set org.gnome.shell.extensions.dash-to-dock autohide 24
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode FIXED
gsettings set org.gnome.mutter center-new-windows true
echo 'Done.'
