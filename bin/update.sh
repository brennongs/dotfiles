#!/usr/bin/env bash
cp ~/.zshrc . &&
echo \nCopied .zshrc!\n &&
cp ~/.psqlrc . &&
echo \nCopied .psqlrc &&
cp -r ~/.ssh .
echo \nCopied .ssh!\n
git add . ./.[a-z]* &&
git commit -am "updating dotfiles from $HOSTNAME" &&
git push