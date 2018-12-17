#!/usr/bin/env bash
TMP=~/dotfiles/tmp
DOTFILES=~/dotfiles/src
REMOTE=false
mkdir $TMP 

function install {
    REMOTE_OMZ=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh

    # install curl, zsh
    sudo apt install curl zsh -y

    # install oh-my-zsh
    curl \
        -fsSL $REMOTE_OMZ \
        -o $TMP/omz.sh
    sed -i "/echo/d" $TMP/omz.sh
    sed -i "/env zsh/d" $TMP/omz.sh
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

# check if oh-my-zsh is installed
if [[ !(-d ~/.oh-my-zsh) ]]; then
    install
fi

# check for remote install
# if remote, change .zshrc to reflect correct changes.
if [[ !(-z ${SSH_CONNECTION+x}) ]]; then
    REMOTE=true
    touch $TMP/.zshrc.remote
    mv $DOTFILES/.zshrc $TMP
    cat $TMP/.zshrc |
    sed -e 's/code/vim/g' |
    sed '/WORKON/d' |
    sed '/virtualenvwrapper/d' |
    sed '139,$ d' >> $TMP/.zshrc.remote
    mv $TMP/.zshrc.remote $DOTFILES/.zshrc
fi
     
# copy necessary files to ~
cp ./src/.zshrc ~
cp ./src/.psqlrc ~
sudo cp ./src/update.sh /etc/cron.weekly/update
sudo chmod +x /etc/cron.weekly/update

# set login shell
chsh -s $(which zsh) $USER

# cleanup
if [[ $REMOTE -eq true ]]; then
    mv $TMP/.zshrc $DOTFILES
fi
rm -rf $TMP

# start new session
zsh
zource