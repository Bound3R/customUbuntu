#!/bin/bash

echo ''
echo ''
echo "██████╗  ██████╗ ██╗   ██╗███╗   ██╗██████╗ ██████╗ ██████╗"
echo "██╔══██╗██╔═══██╗██║   ██║████╗  ██║██╔══██╗╚════██╗██╔══██╗"
echo "██████╔╝██║   ██║██║   ██║██╔██╗ ██║██║  ██║ █████╔╝██████╔╝"
echo "██╔══██╗██║   ██║██║   ██║██║╚██╗██║██║  ██║ ╚═══██╗██╔══██╗"
echo "██████╔╝╚██████╔╝╚██████╔╝██║ ╚████║██████╔╝██████╔╝██║  ██║"
echo "╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚═════╝ ╚═╝  ╚═╝"
echo ''
echo ''                                                    

# Goal: Script which automatically sets up a new Ubuntu Machine after installation
# This is a basic install, easily configurable to your needs

echo "Welcome! Let's start setting up your system. It could take more than 10 minutes, be patient"

# Test to see if user is running with root privileges.
if [[ "${UID}" -ne 0 ]]; then
    echo 'Must execute with sudo or root' >&2
    exit 1
fi

echo ''
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
echo 'SO essentials'
echo ''
echo 'Installing curl'
sudo apt install libxss1 libappindicator1 libindicator7 -y
sudo apt install curl -y
sudo apt install snapd -y
sudo snap install snap-store -y

echo ''
echo 'Customize system'
echo ''
echo 'Installing gnome-tweak-tool'
sudo apt install gnome-tweak-tool -y
echo 'Install Third-Party theme'
sudo snap install communitheme -y
echo 'Configure system && communitheme'
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true
gsettings set org.gnome.desktop.interface gtk-theme 'Communitheme'
gsettings set org.gnome.desktop.interface cursor-theme 'communitheme'
gsettings set org.gnome.desktop.interface icon-theme 'communitheme'
echo 'Installing tilix'
sudo apt install tilix -y
echo 'Setting terminator as default terminal'
gsettings set org.gnome.desktop.default-applications.terminal exec 'terminator'
echo 'Done.'

echo ''
echo 'Installing essentials development...'
echo ''
echo 'Installing git'
sudo apt install git -y
echo 'Installing jdk'
sudo apt install default-jdk -y
java -version
echo 'Installing python3-pip'
sudo apt-get install python3-pip -y
echo 'Installing nodejs'
sudo apt install nodejs -y
echo 'Installing npm'
sudo apt install npm -y
echo 'Installing yarn'
sudo npm install --global yarn -y
echo 'Installing expo'
sudo npm install -g expo-cli -y
echo 'Done.'

echo ''
echo 'Installing applications for development...'
echo ''
echo 'Installing 1password'
sudo snap install 1password --edge -y
echo 'Installing vscode'
sudo snap install code --classic -y
echo 'Installing postman'
sudo snap install postman -y
echo 'Installing beekeeper studio'
sudo snap install beekeeper-studio -y
echo 'Installing smartgit'
sudo apt install smartgit -y
sudo apt install smartgithg -y
echo 'Installing spotify'
sudo snap install spotify -y
echo 'Installing gimp'
sudo snap install gimp -y
echo 'Installing inkscape'
sudo snap install inkscape -y
echo 'Installing simplescreenrecorder'
sudo snap install simplescreenrecorder -y
echo 'Done.'

echo ''
echo 'Installing selected favourite applications...'
echo 'Installing steam'
sudo apt install steam -y
echo 'Installing safeeyes'
sudo apt install safeeyes -y
echo 'Done.'

echo ''
echo 'Updating and Cleaning Unnecessary Packages'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
clear
echo 'Done.'

echo ''
echo "What name do you want to use in GIT user.name?"
echo "For example, mine will be \"John Doe\""
read git_config_user_name

echo "What email do you want to use in GIT user.email?"
echo "For example, mine will be \"example@mail.com\""
read git_config_user_email

echo "Setting up your git global user name and email"
git config --global user.name "$git_config_user_name"
git config --global user.email $git_config_user_email
echo 'Done.'

echo ''
echo "creation dev environment initiated, please wait for the end of the process."
echo 'Create development folder'
mkdir development
echo 'Done.'
echo 'Add vscode extensions'
code --install-extension Equinusocio.vsc-material-theme
code --install-extension Equinusocio.vsc-material-theme-icons
code --install-extension ms-vscode.sublime-keybindings
code --install-extension VisualStudioExptTeam.vscodeintellicode
code --install-extension christian-kohler.path-intellisense
code --install-extension vincaslt.highlight-matching-tag
code --install-extension Zignd.html-css-class-completion
code --install-extension shardulm94.trailing-spaces
code --install-extension naumovs.color-highlight
code --install-extension wayou.vscode-todo-highlight
code --install-extension mgmcdermott.vscode-language-babel
code --install-extension Syler.sass-indented
code --install-extension jundat95.react-native-snippet
code --install-extension msjsdiag.vscode-react-native
code --install-extension bibhasdn.django-html
code --install-extension CodeStream.codestream
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ritwickdey.LiveServer
echo 'Done.'
