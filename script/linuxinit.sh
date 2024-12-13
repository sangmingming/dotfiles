#! /usr/bin/sh

# install zsh
 sudo apt-get install zsh
 sudo chsh -s $(which zsh) $USER

 sudo apt-get install git
 
 sudo add-pat-repository ppa:neovim-ppa/unstable
 sudo apt-get update
 sudo apt-get install neovim

sudo update-alternatives --install /usr/bin/vi vi "/usr/bin/nvim" 100
sudo update-alternatives --install /usr/bin/vim vim "/usr/bin/nvim" 100

sudo apt-get install fcitx5
sudo apt install  	fcitx5-rime
#xdg autostart
mkdir -p ~/.config/autostart && cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart

#https://wiki.archlinuxcn.org/zh-hans/Fcitx5

#celluloid mpv gnome player
sudo add-apt-repository ppa:xuzhen666/gnome-mpv
sudo apt-get update
sudo apt-get install celluloid
sudo apt-get install zeal

udo apt-get install fuse

#syncthing
sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
sudo apt-get update
sudo apt-get install syncthing
sudo apt install lua5.1
sudo apt install build-essential libreadline-dev unzip

#openssh
sudo apt install openssh-server
sudo systemctl status ssh
sudo ufw allow ssh

curl -f https://zed.dev/install.sh | sh


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

#install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
