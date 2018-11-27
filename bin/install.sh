#!/usr/bin/env bash

# ensure curl, zsh

function install {
    sudo apt install curl zsh -y
    chsh -s $(which zsh) $USER
    sh \
        -c "$(curl \
            -fsSLi https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    git clone \
        https://github.com/bhilburn/powerlevel9k.git \
        ~/.oh-my-zsh/custom/themes/powerlevel9k
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

if [[ !(-d ~/.oh-my-zsh) ]]; then
    install
fi

# copy necessary files to ~
cp ./.zshrc ~
cp ./.psqlrc ~