#!/bin/bash
# cross platform install
# written by brennon schow <brennonschow@gmail.com>

function install {
    if [[ `uname` -eq 'Darwin' ]]; then
        brew install $1
    else
        sudo apt install $1
    fi
}