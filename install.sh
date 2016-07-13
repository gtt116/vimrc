#!/bin/bash

which apt-get 2>/dev/null
is_debian=$?

if [ $is_debian == 0 ]; then
    echo ' ******* Debian/Ubuntu detected **********'
    sudo apt-get update
    sudo apt-get install exuberant-ctags -y
else
    echo ' ******* Redhat/Centos detected **********'
    sudo yum install -y ctags
fi


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
    echo '#########################'
    echo 'install finished.'
    echo 'If you want to install vim-go, Please install golang first,'
    echo 'then running: go get -u github.com/jstemmer/gotags'
    exit 0
else
    echo '~/vimrc does not exist'
    exit 0
fi
