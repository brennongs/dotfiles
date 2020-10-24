#!/usr/bin/env bash
# 
# author: Brennon Schow <brennonschow@gmail.com> gh: @brennongs
# updated 10/23/2020
#
TMP=~/tmp
REMOTE=false

function main {
  REMOTE_OMZ=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

  # install homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # install curl, zsh
  brew install curl
  brew install zsh

  # silently install oh-my-zsh
  curl \
    -fsSL $REMOTE_OMZ \
    -o $TMP/omz.sh
  sed -i '' '/exec zsh/d' $TMP/omz.sh
  sh $TMP/omz.sh
  rm -rf $TMP/omz.sh
  ZSH_CUSTOM=~/.oh-my-zsh/custom
  
  # install powerlevel9k
  git clone \
    https://github.com/bhilburn/powerlevel9k.git \
    $ZSH_CUSTOM/themes/powerlevel9k
  
  # install zsh-syntax-highlighting
  git clone \
    https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

  # install vscode
  brew cask install visual-studio-code

  # install slack
  brew cask install slack
}

# ============
# start script
# ============
mkdir $TMP 

# check if oh-my-zsh is installed
if [[ !(-d ~/.oh-my-zsh) ]]; then
  main
fi

# check for remote install
# if remote, change .zshrc to reflect correct changes.
# if [[ !(-z ${SSH_CONNECTION+x}) ]]; then
#     REMOTE=true
#     touch $TMP/.zshrc.remote
#     mv $DOTFILES/.zshrc $TMP
#     cat $TMP/.zshrc |
#     sed -e 's/code/vim/g' |
#     sed '/WORKON/d' |
#     sed '/virtualenvwrapper/d' |
#     sed '141,$ d' >> $TMP/.zshrc.remote
#     mv $TMP/.zshrc.remote $DOTFILES/.zshrc
# fi
     
# copy necessary files to ~
cp ./src/.zshrc ~
cp ./src/.psqlrc ~
cp ./src/plist/com.brennongs* ~/Library/LaunchAgents

# set login shell
chsh -s $(which zsh) $USER

# cleanup
rm -rf $TMP

# start new session
zsh
zource
