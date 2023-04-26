# CustomUbuntu
![Ubuntu Version](https://img.shields.io/badge/ubuntu-22.04%20LTS-orange?style=for-the-badge&logo=ubuntu&logoColor=white)

## Requirements
Must execute with sudo or root.   
:warning: Currently supports only Ubuntu 22.04 LTS  


Installed curl:
```sh
sudo apt update
sudo apt install curl -y
```

## :rocket: Installation

Download and install !remember run as `root`:
```sh
curl -f https://raw.githubusercontent.com/Bound3R/customUbuntu/main/setup.sh -o setup.sh && sudo bash setup.sh
```

## :art: GNOME extensions
| Name                     	| Link                                                                                                                                       	|
|--------------------------	|--------------------------------------------------------------------------------------------------------------------------------------------	|
| Bluetooth quick connect  	| [https://extensions.gnome.org/extension/1401/bluetooth-quick-connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect) 	|
| Random Wallpaper         	| [https://extensions.gnome.org/extension/1040/random-wallpaper](https://extensions.gnome.org/extension/1040/random-wallpaper)               	|
| Pano - Clipboard Manager 	| [https://extensions.gnome.org/extension/5278/pano](https://extensions.gnome.org/extension/5278/pano)                                       	|

## :hammer_and_pick: Developer configuration
Create development folder:
```sh
mkdir Development
```
Install `nvm`
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
```

## :computer: VSC Extensions
Launch VS Code Quick Open (<kbd>Ctrl</kbd>+<kbd>P</kbd>), paste the following command, and press enter.

| Name                                                                                                      	| Command                                   	|
|-----------------------------------------------------------------------------------------------------------	|--------------------------------------------	|
| [EditorConfig for VS Code](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig) 	| `ext install EditorConfig.EditorConfig`    	|
| [GitHub Copilot](https://marketplace.visualstudio.com/items?itemName=GitHub.copilot)                      	| `ext install GitHub.copilot`               	|
| [Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces)         	| `ext install shardulm94.trailing-spaces`   	|
| [TODO Highlight](https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight)         	| `ext install wayou.vscode-todo-highlight` 	|
| [Live Share](https://marketplace.visualstudio.com/items?itemName=MS-vsliveshare.vsliveshare)              	| `ext install MS-vsliveshare.vsliveshare`  	|
| [Thunder Client](https://marketplace.visualstudio.com/items?itemName=rangav.vscode-thunder-client)         	| `ext install rangav.vscode-thunder-client`	|

Or use this commands for install all vsc extensions by terminal

```sh
code --install-extension EditorConfig.EditorConfig
code --install-extension GitHub.copilot
code --install-extension shardulm94.trailing-spaces
code --install-extension wayou.vscode-todo-highlight
code --install-extension MS-vsliveshare.vsliveshare
code --install-extension rangav.vscode-thunder-client
```

<details>
<summary>Optionals</summary>

Use this commands for install all optionals vsc extensions by shell
```sh
code --install-extension softwaredotcom.swdc-vscode
code --install-extension christian-kohler.path-intellisense
code --install-extension naumovs.color-highlight
code --install-extension Syler.sass-indented
code --install-extension msjsdiag.vscode-react-native
```
</details>
<hr>

## :memo: ToDo
- [x] gnome extensions
- [x] vsc Extensions
- [x] use Flatpack for increase performance
- [ ] sshpass
- [x] scrcpy
- [ ] command for disable/enable mic input
- [ ] docker/docker-desktop
- [ ] anydesk
- [x] wine
- [ ] proton
- [ ] AOE2 HD configuration
- [ ] Configuration for use custom Theme
