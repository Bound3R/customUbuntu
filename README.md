<!-- Heading -->
<h1 align="center">customUbuntu</h1>
<p align="center"><em>Post-installation script for Ubuntu-based systems</em> to update packages, install frequently used apps, and configure development environments.</p>
<br>

---

## Requirements

[![Ubuntu Version](https://img.shields.io/badge/ubuntu-24.04%20LTS-orange?style=for-the-badge&logo=ubuntu&logoColor=white)](https://releases.ubuntu.com)

:warning: **Run with `root` privileges**. Ensure you have `curl` installed:

```bash
sudo apt update
sudo apt install curl -y
```

## :rocket: Installation

**Important**: It is highly recommended to read through the `setup.sh` script to understand what will be installed and configured on your system. 

Download and install (remember to run as `root`):
```sh
curl -f https://raw.githubusercontent.com/Bound3R/customUbuntu/main/setup.sh -o setup.sh && sudo bash setup.```
```

## :hammer_and_pick: Developer configuration
Create development folder:
```sh
mkdir ~/Development
```

## :wrench: Tools
- **Development**:
  - [Git](https://git-scm.com)
  - [Docker](https://www.docker.com)
  - [Visual Studio Code](https://code.visualstudio.com)
  - [gitkraken](https://www.gitkraken.com)
  - [wrap terminal](https://www.warp.dev)
  - [android studio](https://developer.android.com/studio) 
  - [Insomnia](https://insomnia.rest)
  - [scrcpy](https://github.com/Genymobile/scrcpy)
  - [termius](https://termius.com)
  - [boxes](https://apps.gnome.org/es/Boxes)
  - [bottles](https://usebottles.com)

- **Design & Others**
  - inkscape
  - gimp
  - steam
  - discord
  - stremio
  - plex
  - vlc

## :art: GNOME extensions
GNOME Shell Extensions are a great way to customize the GNOME desktop experience, allowing you to tweak components like window management, launch animations, and more.

You can install GNOME Shell Extensions directly through the browser via [GNOME Extensions website](https://extensions.gnome.org)

| Name                     | Link                                                                                                                                  |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Bluetooth Quick Connect   | [https://extensions.gnome.org/extension/1401/bluetooth-quick-connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect)   |
| Night Theme Switcher      | [https://extensions.gnome.org/extension/2236/night-theme-switcher](https://extensions.gnome.org/extension/2236/night-theme-switcher)     |


<hr>

## :memo: ToDo
- [x] Add GNOME extensions support
- [x] Prioritize Flatpak/Snap for app installation
- [x] Add scrcpy installation
- [ ] Add a command to enable/disable microphone input
- [x] Docker and Docker Desktop setup
