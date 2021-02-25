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

# Goal: Script which automatically sets up a new Ubuntu Machine after installation
# This is a basic install, easily configurable to your needs

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
sudo add-apt-repository multiverse -y
sudo add-apt-repository ppa:eugenesan/ppa -y
sudo add-apt-repository ppa:slgobinath/safeeyes -y
sudo apt-get update -y
# Dist-Upgrade
echo 'Performing system upgrade...'
sudo apt-get dist-upgrade -y
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
echo 'Done.'

echo ''
echo '##########'
echo 'SO essentials'
echo ''
echo '>>> Installing libs'
sudo apt install libxss1 libappindicator1 libindicator7 -y
echo '>>> Installing snap'
sudo apt install snapd -y
echo '>>> Installing snap-store'
sudo snap install snap-store
echo 'Done.'

echo ''
echo '##########'
echo 'Customize system'
echo ''
echo '>>> Installing gnome-tweak-tool'
sudo apt install gnome-tweak-tool -y
echo '>>> Configure system'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
echo '>>> Installing tilix'
sudo apt install tilix -y
echo '>>> Setting terminator as default terminal'
gsettings set org.gnome.desktop.default-applications.terminal exec 'tilix'
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
echo '>>> Installing 1password'
sudo snap install 1password --edge
echo '>>> Installing vscode'
sudo snap install code --classic
echo '>>> Installing postman'
sudo snap install postman
echo '>>> Installing beekeeper studio'
sudo snap install beekeeper-studio
echo '>>> Installing smartgit'
sudo apt install smartgit -y
sudo apt install smartgithg -y
echo '>>> Installing slack'
sudo snap install slack --classic
echo 'Done.'

echo ''
echo '##########'
echo 'Installing selected favourite applications...'
echo '>>> Installing spotify'
sudo snap install spotify
echo '>>> Installing gimp'
sudo snap install gimp
echo '>>> Installing inkscape'
sudo snap install inkscape
echo '>>> Installing simplescreenrecorder'
sudo snap install simplescreenrecorder
echo '>>> Installing steam'
sudo apt install steam -y
echo '>>> Installing safeeyes'
sudo apt install safeeyes -y
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

echo ''
echo '##########'
echo 'creation dev environment initiated, please wait for the end of the process.'
echo 'Create development folder'
mkdir development
echo 'Done.'
