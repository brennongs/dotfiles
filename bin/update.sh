#!/usr/bin/env bash
git add . ./.[a-z]* &&
git commit -am "updating dotfiles from $HOSTNAME" &&
git push