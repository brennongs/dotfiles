#!/usr/bin/env bash
# 
# author: Brennon Schow <brennonschow@gmail.com> gh: @brennongs
# updated 6/22/2019
#
TMP=~/dotfiles/tmp
DOTFILES=~/dotfiles/src
REMOTE=false

# cross platform installation
function inst {
    if [[ `uname` -eq 'Darwin' ]]; then
        brew install $1
    else
        sudo apt install $1
    fi
}

# function for installing all dependencies
function init {
    REMOTE_OMZ=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

    # install homebrew
    if [[ `uname` -eq 'Darwin' ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    # install curl, zsh
    inst curl
    inst zsh

    # install oh-my-zsh
    curl \
        -fsSL $REMOTE_OMZ \
        -o $TMP/omz.sh
    if [[ `uname` -eq 'Darwin' ]]; then 
        sed -i '' '/exec zsh/d' $TMP/omz.sh
    else
        sed -i "/exec zsh/d" $TMP/omz.sh
    fi
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
}

# ============
# start script
# ============
mkdir $TMP 

# check if oh-my-zsh is installed
if [[ !(-d ~/.oh-my-zsh) ]]; then
    init
else
    return
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
cp ./src/.vimrc ~

# set login shell
chsh -s $(which zsh) $USER

# cleanup
rm -rf $TMP

# start new session
zsh
zource
