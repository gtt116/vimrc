#!/bin/bash

sudo apt-get update
sudo apt-get install exuberant-ctags -y

if [[ -e ~/.vimrc ]]; then
    echo 'Backup vimrc to ~/.vimrc.bak'
    mv ~/.vimrc ~/.vimrc.bak
fi

if [[ -d ~/.vim ]]; then
    echo 'Backup vim to ~/.vim.bak'
    mv ~/.vim ~/.vim.bak
fi

if [[ -d ~/vimrc ]];then
    ln -s ~/vimrc/vimrc ~/.vimrc
    ln -s ~/vimrc/vim ~/.vim
    echo 'install finished.'
    exit 0
else
    echo '~/vimrc does not exist'
    exit 0
fi
