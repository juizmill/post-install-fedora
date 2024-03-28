#!/bin/bash

## UPDATE SYSTEM
sudo dnf update

## INSTALL 
sudo dnf install wget vim curl zsh zip unzip
sudo dnf groupinstall "Development Tools"
sudo dnf install autoconf re2c libxml2-devel sqlite-devel libcurl-devel gd-devel openssl g++ oniguruma-devel libpq libpq-devel readline-devel libzip-devel

## CHANGE TO ZSH
chsh -s $(which zsh)

## INSTALL VSCODE
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code

## INSTALL FONT
mkdir -R ~/.local/share/fonts/
wget https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -O /tmp/
tar -xvzf /tmp/Fira_Code_v6.2.zip -d /tmp
mv /tmp/ttf/*.ttf ~/.local/share/fonts/
 
## LOAD FONTS
sudo fc-cache -f -v

## INSTALL ASDF
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0