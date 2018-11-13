#!/usr/bin/env bash

# ensure curl
shopt extglob
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
cp ./.!($exclude).zshrc ~/.zshrc &&
cp ./.psql ~ &&
cp -r ./.ssh ~/.ssh &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"