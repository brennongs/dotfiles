#!/usr/bin/env bash

# ensure curl, zsh
if ! [ -x "$(command -v curl)" ]; then
    sudo apt install curl zsh -y
fi

# install oh-my-zsh, powerlevel9k
sh -c "$(curl -fsSL \
https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# copy necessary files to ~
if [ $1 == "remote" ]
then
    cp ./.remote.zshrc ~/.zshrc &&
    source ~/.remote.zshrc
else
    cp ./.local.zshrc ~/.zshrc &&
    source ~/.remote.zshrc
fi
cp ./.psqlrc ~
cp -r ./.oh-my-zsh ~