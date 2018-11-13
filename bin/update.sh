#!/usr/bin/env bash
cp ~/.zshrc . &&
printf \nCopied .zshrc!\n &&
cp ~/.psqlrc . &&
printf \nCopied .psqlrc &&
cp -r ~/.ssh .
printf \nCopied .ssh!\n
git add . ./.[a-z]* &&
git commit -am "updating dotfiles from $HOSTNAME" &&
git push