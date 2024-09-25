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
# Note!: Currently supports only Ubuntu 24.04 LTS

echo "Welcome! Let's start setting up your system. This might take a while, so be patient."

# Test to see if user is running with root privileges.
if [[ "${UID}" -ne 0 ]]; then
    echo 'Must execute with sudo or root privileges' >&2
    exit 1
fi

# Update and Upgrade the System
echo ''
echo '##########'
echo 'Updating repository information...'
sudo apt update && sudo apt upgrade -y

# Install Snap and Flatpak support
echo ''
echo '##########'
echo 'Installing Snap and Flatpak...'
sudo apt install -y snapd flatpak gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable Universe, Multiverse Repositories
echo ''
echo '##########'
echo 'Enabling Universe and Multiverse repositories...'
sudo add-apt-repository universe -y
sudo add-apt-repository multiverse -y

# Install Development Tools
echo ''
echo '##########'
echo 'Installing development tools...'
sudo apt install -y zsh git curl

# Install nvm and yarn using the preferred method
echo 'Installing NVM (Node Version Manager) and Yarn...'
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
nvm install --lts
npm install --global yarn

# Install Docker
echo 'Installing Docker...'
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Install Development Apps via Flatpak/Snap
echo ''
echo '##########'
echo 'Installing development apps...'
sudo snap install --classic code        # Visual Studio Code
sudo snap install gitkraken             # GitKraken
sudo snap install android-studio --classic # Android Studio
sudo snap install insomnia              # Insomnia
sudo snap install termius-app           # Termius
sudo apt install -y scrcpy              # Use APT for scrcpy (Flatpak not recommended)
sudo flatpak install -y flathub com.usebottles.bottles # Bottles
sudo flatpak install -y flathub org.gnome.Boxes        # GNOME Boxes

# Install Docker Desktop from .deb (Not available via Snap or Flatpak)
echo 'Installing Docker Desktop...'
curl -LO https://desktop.docker.com/linux/main/amd64/docker-desktop-<latest-version>.deb
sudo dpkg -i docker-desktop-<latest-version>.deb
sudo apt --fix-broken install -y

# Install Design Apps via Flatpak
echo ''
echo '##########'
echo 'Installing design apps...'
sudo flatpak install -y flathub org.inkscape.Inkscape   # Inkscape
sudo flatpak install -y flathub org.gimp.GIMP           # GIMP

# Install Browsers via Flatpak
echo ''
echo '##########'
echo 'Installing browsers...'
sudo flatpak install -y flathub com.opera.Opera         # Opera
sudo flatpak install -y flathub com.google.Chrome       # Google Chrome

# Install Media Apps via Flatpak/Snap
echo ''
echo '##########'
echo 'Installing media apps...'
sudo flatpak install -y flathub com.valvesoftware.Steam  # Steam
sudo snap install discord                               # Discord
sudo flatpak install -y flathub com.stremio.Stremio      # Stremio
sudo flatpak install -y flathub tv.plex.PlexDesktop      # Plex
sudo flatpak install -y flathub org.videolan.VLC         # VLC

# Customization - Touchégg for Multi-Touch Gestures
echo ''
echo '##########'
echo 'Installing Touchégg for touchpad gestures...'
sudo flatpak install -y flathub com.github.joseexposito.touchegg

# Install GNOME Extensions
echo ''
echo '##########'
echo 'Installing GNOME extensions...'
gnome-extensions install bluetooth-quick-connect@bjarosze.gmail.com
gnome-extensions install nightthemeswitcher@romainvigier.fr

# Final Updates and Cleanup
echo ''
echo '##########'
echo 'Cleaning up unnecessary packages...'
sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
clear

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

echo 'Setup complete! Please restart your system for all changes to take effect.'
