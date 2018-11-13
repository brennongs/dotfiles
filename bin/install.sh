#!/usr/bin/env bash

shopt -s extglob
# ensure curl
if ! [ -x "$(command -v curl)" ]; then
    sudo apt install curl -y
fi

# identify server type
exclude='local'
if [ $1 == 'local' ]; then
    exclude='remote'
fi

# copy necessary files to home,
# install oh-my-zsh
sh -c "$(curl -fsSL \
https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &&
cp -r ./.!(git|*.zshrc|.)* ~ &&
cp ./.!($exclude).zshrc ~/.zshrc