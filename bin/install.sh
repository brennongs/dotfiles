#!/usr/bin/env bash
export DOTFILES=~/dotfiles
cd $DOTFILES

function install {
    REMOTE_OMZ=https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
    # install curl, zsh
    sudo apt install curl zsh -y

    # install oh-my-zsh
    curl \
        -fsSL $REMOTE_OMZ \
        -o $DOTFILES/omz.sh
    sed -i "/echo/d" $DOTFILES/omz.sh
    sed -i "/env zsh/d" $DOTFILES/omz.sh
    sh $DOTFILES/omz.sh
    rm -rf $DOTFILES/omz.sh
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
    sed -i -e 's/code/vim/g' ./src/.zshrc
    sed -i '/WORKON/d' ./src/.zshrc
    sed -i '/virtualenvwrapper/d' ./src/.zshrc
    sed -i '$ d' ./src/.zshrc
fi
     
# copy other necessary files to ~
cp ./src/.zshrc ~
cp ./src/.psqlrc ~
sudo cp ./src/update.sh /etc/cron.weekly/update
sudo chmod +x /etc/cron.weekly/update

chsh -s $(which zsh) $USER
zsh
zource