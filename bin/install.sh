#!/usr/bin/env bash

# ensure curl, zsh
if ! [[ -x "$(command -v curl)" ]]; then
    sudo apt install curl zsh -y
fi

if ! [[ -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL \
    https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

# copy necessary files to ~
cp ./.zshrc ~
cp ./.psqlrc ~