# customUbuntu

## Requirements
Must execute with sudo or root.  
:warning: Currently supports only Ubuntu 20.04 LTS.

Installed curl:
```sh
sudo apt update
sudo apt install curl -y
```

## :rocket: Installation

Download:
```sh
curl -f https://raw.githubusercontent.com/Bound3R/customUbuntu/main/setup.sh -o setup.sh
```

Remember run as root:
```sh
sudo bash setup.sh
```

Alternative download and install short:
```sh
curl -f https://raw.githubusercontent.com/Bound3R/customUbuntu/main/setup.sh -o setup.sh && sudo bash setup.sh
```

---

## :art: GNOME config
After install gnome-tweak-tool, use the browser complement to add:  
[Bluetooth quick connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect)  
[Random Wallpaper](https://extensions.gnome.org/extension/1040/random-wallpaper)  
[system-monitor](https://extensions.gnome.org/extension/120/system-monitor)

---

## :computer: :sunglasses: Developer config

### Creation dev environment
Create development folder:
```sh
mkdir development
```
Install `nvm`
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
```
```sh
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

### VSCODE extensions
use this commands for install by console
```sh
code --install-extension EditorConfig.EditorConfig
code --install-extension Equinusocio.vsc-material-theme-icons
code --install-extension shardulm94.trailing-spaces
code --install-extension wayou.vscode-todo-highlight
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ritwickdey.LiveServer
code --install-extension rangav.vscode-thunder-client
code --install-extension GitHub.copilot
```

optional extensions
```sh
code --install-extension ms-vscode.sublime-keybindings
code --install-extension christian-kohler.path-intellisense
code --install-extension naumovs.color-highlight
code --install-extension Syler.sass-indented
code --install-extension msjsdiag.vscode-react-native
code --install-extension GitHub.copilot
code --install-extension softwaredotcom.swdc-vscode
```

---

## :memo: ToDo
- [x] gnome extensions
- [x] vsc Extensions
- [ ] sshpass
- [x] scrcpy
- [ ] command for disable/enable mic input
- [ ] docker
- [ ] filezilla
- [ ] anydesk
- [ ] teamviewer
- [ ] wine
- [ ] proton
- [ ] AOE2 HD configuration
