# customUbuntu

## Requirements
Must execute with sudo or root.  
:warning: Currently supports only Ubuntu 22.04 LTS.

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

---

## :computer: :sunglasses: Developer config

### Creation dev environment
Create development folder:
```sh
mkdir Development
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
code --install-extension GitHub.copilot
code --install-extension shardulm94.trailing-spaces
code --install-extension wayou.vscode-todo-highlight
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension rangav.vscode-thunder-client
```

optional extensions
```sh
code --install-extension GitHub.copilot
code --install-extension softwaredotcom.swdc-vscode
code --install-extension christian-kohler.path-intellisense
code --install-extension naumovs.color-highlight
code --install-extension Syler.sass-indented
code --install-extension msjsdiag.vscode-react-native
```

---

## :memo: ToDo
- [x] gnome extensions
- [x] vsc Extensions
- [x] use Flatpack for increase performance
- [ ] sshpass
- [x] scrcpy
- [ ] command for disable/enable mic input
- [ ] docker
- [ ] anydesk
- [x] wine
- [ ] proton
- [ ] AOE2 HD configuration
- [ ] Configuration for use custom Theme
