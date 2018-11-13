#!/usr/bin/env bash

# copy necessary files to this dir
cp ~/.zshrc . &&
printf "\nCopied .zshrc!\n" &&
cp ~/.psqlrc . &&
printf "\nCopied .psqlrc\n" &&
cp -r ~/.ssh . &&
printf "\nCopied .ssh!\n" &&

# push to git
git add . ./.[a-z]* &&
git commit -am "updating dotfiles from $HOSTNAME" &&
git push