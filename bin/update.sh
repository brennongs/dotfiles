#!/usr/bin/env bash
cp ~/.zshrc . &&
echo "\nCopied .zshrc!\n" &&
cp -r ~/.oh-my-zsh . &&
echo "\nCopied .oh-my-zsh!\n" &&
cp -r ~/.ssh . &&
echo "\nCopied .ssh!\n"
cp ~/.psqlrc . &&
git add . ./.[a-z]* &&
git commit -am "updating dotfiles from $HOSTNAME" &&
git push