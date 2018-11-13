#!/usr/bin/env bash

# ensure curl
if ! [ -x "$(command -v curl)" ]; then
    sudo apt install curl -y
fi

# copy necessary files to home,
# install oh-my-zsh
if [ $1 == "remote" ]
then
    cp ./.remote.zshrc ~/.zshrc
else
    cp ./.local.zshrc ~/.zshrc
fi
cp ./.psqlrc ~ &&
cp -r ./.ssh ~/.ssh &&
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"