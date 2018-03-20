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
 * vim-easygrep
 * vim-vue (https://github.com/posva/vim-vue)
 * vim-yaml-folds (https://github.com/pedrohdz/vim-yaml-folds)

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

*Please using hjkl to move cursor*

 * using up to enlarge window
 * using down to shrink window

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

Easygrep Keymapping
====================

```
<Leader>vv  - Grep for the word under the cursor, match all occurences,
              like |gstar|
<Leader>vV  - Grep for the word under the cursor, match whole word, like
              |star|
<Leader>va  - Like vv, but add to existing list
<Leader>vA  - Like vV, but add to existing list
<Leader>vr  - Perform a global search on the word under the cursor
              and prompt for a pattern with which to replace it.
<Leader>vo  - Select the files to search in and set grep options
<Leader>vy* - Invoke any option from the options explorer, where * is the
              shortcut for that option.
              e.g. <Leader>vyr - toggles recursion
                   <Leader>vyb - sets buffer grepping mode
                   etc.
```

Yaml Fold Keypmapping
======================
```
zi          -   switch folding on or off
za          -   toggle current fold open/closed
zc          -   close current fold
zR          -   open all folds
zM          -   close all folds
zv          -   expand folds to reveal cursor
```
