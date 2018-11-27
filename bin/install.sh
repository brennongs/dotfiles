#!/usr/bin/env bash

function install {
    # install curl, zsh
    sudo apt install curl zsh -y
    chsh -s $(which zsh) $USER

    # install oh-my-zsh
    sh \
        -c "$(curl \
            -fsSLi https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    # install powerlevel9k
    git clone \
        https://github.com/bhilburn/powerlevel9k.git \
        ~/.oh-my-zsh/custom/themes/powerlevel9k
    
    # install zsh-syntax-highlighting
    git clone \
        https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
}

# check if oh-my-zsh is installed
if [[ !(-d ~/.oh-my-zsh) ]]; then
    install
fi

# copy other necessary files to ~
cp ./.zshrc ~
cp ./.psqlrc ~