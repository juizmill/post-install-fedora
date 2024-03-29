#!/bin/bash

## UPDATE SYSTEM
sudo dnf update

## INSTALL 
sudo dnf -y install wget vim curl zsh zip unzip
sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install autoconf re2c libxml2-devel sqlite-devel libcurl-devel gd-devel openssl g++ oniguruma-devel libpq libpq-devel readline-devel libzip-devel

## INSTALL FONT
mkdir -p ~/.local/share/fonts/
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -P /tmp/
unzip /tmp/Fira_Code_v6.2.zip -d /tmp
mv /tmp/ttf/*.ttf ~/.local/share/fonts/
 
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.local/share/fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.local/share/fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.local/share/fonts/
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.local/share/fonts/

## LOAD FONTS
sudo fc-cache -f -v

## CHANGE TO ZSH
chsh -s $(which zsh)

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k


## INSTALL ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0

source ~/.zshrc

## INSTALL ZINIT
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

asdf plugin-add rust https://github.com/code-lever/asdf-rust.git
asdf plugin-add php https://github.com/asdf-community/asdf-php.git
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

asdf install rust 1.76.0
asdf install php 8.2.15
asdf install php 8.3.2
asdf install nodejs 20.11.0

asdf global rust 1.76.0
asdf global php 8.3.2
asdf global nodejs 20.11.0

## INSTALL TOLLS

## INSTALL VSCODE
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y check-update
sudo dnf -y install code

## INSTALL DBEAVER
sudo rpm -i https://dbeaver.io/files/dbeaver-ce-latest-stable.x86_64.rpm


## JETBRAINS TOOLBOX
wget https://download-cdn.jetbrains.com/toolbox/jetbrains-toolbox-2.2.3.20090.tar.gz -P /tmp/
tar -xvzf /tmp/jetbrains-toolbox-2.2.3.20090.tar.gz -C /tmp
chmod +x /tmp/jetbrains-toolbox-2.2.3.20090/jetbrains-toolbox
cd /tmp/jetbrains-toolbox-2.2.3.20090
./jetbrains-toolbox
cd ~

## SLACK
flatpak install -y --noninteractive flathub com.slack.Slack

## SLACK
flatpak install -y --noninteractive flathub com.discordapp.Discord



## INSTALL DOCKER
sudo dnf remove docker \
    docker-client \
    docker-client-latest \
    docker-common \
    docker-latest \
    docker-latest-logrotate \
    docker-logrotate \
    docker-selinux \
    docker-engine-selinux \
    docker-engine

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl start docker

sudo groupadd docker
sudo usermod -aG docker $USER


reboot
