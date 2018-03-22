#!/bin/bash

#Installation command
cmd="sudo apt-get install -y"
pre_cmd="sudo apt-get update"
pkgs="python3-pip vim git"

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
