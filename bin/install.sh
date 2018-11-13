#!/usr/bin/env bash

# ensure curl is installed
if ! [ -x "$(command -v curl)" ]; then
    sudo apt install curl -y
fi

# copy necessary files to home,
# install oh-my-zsh
cp -r ./.[a-z]* ~ &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"