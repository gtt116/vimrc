Vimrc
=========

A vim config to make a awesome python IDE, currently just support for Ubuntu. Includes below plugins:

 * pathogen
 * mustang-vim
 * supertab
 * vim-colors-solarized
 * vim-powerline
 * vim-surround
 * ctrlp.vim
 * nerdtree
 * tagbar
 * vim-easymotion
 * vim-puppet
 * indentLine
 * python-mode
 * toggle_comment
 * vim-fugitive
 * vim-python-pep8-indent
 * vim-autoclose
 * vim-nerdtree-tabs
 * vim-ragtag

How to install:

    cd ~
    git clone git://github.com/gtt116/vimrc
    cd vimrc
    ./install.sh
  
done


Snapshot
========
<img src="https://raw.githubusercontent.com/gtt116/vimrc/master/snapshot.png"/>


Features
========
 * Default colorschema is solarized-light (vim-colors-solarized)
 * saving file automatic run pep8 checking
 * automatic set tab to 4 space when editing *.py
 * automatic set tab to 2 space when editing *.html, css, js
 * automatic syntax hightlight for *.py, *.html *.html(django template), *.css, *.js, *.pp(puppet)

Key mapping
==========
In vim view mode,

 * using , + n + t  to toggle nerdtree
 * using , + t + b to toggle tabbar
 * using , + g jump to definition of function/class/variable
 * using , + t to create a new tab
 * using g + t to move to next tab
 * using g + T to move to pre tab
 * using [ctrl] + H/J/K/L to move through windows
 * using q to toggle line comment
 * using [ctrl] + p openup ctrlp menu

 * using , + l to load cscope databse into CCtree.
 * using <C-c>> to open CCTree Forword Call Tree.
 * using <C-c>< to open CCTree Reverse Call Tree.
 * using <C-c>[ to decrease depth of tree.
 * using <C-c>] to increase depth of tree.
