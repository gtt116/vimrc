" vimrc of gtt116

syntax on
let mapleader = ","
set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ 10
set pastetoggle=<F10>

if has("mac") || has("macunix")
    set guifont=Monaco:h12
endif

" Init pathogen
call pathogen#infect()
call pathogen#helptags()

"FileType support
set filetype=on
filetype plugin indent on

autocmd FileType javascript,html,css,php,yaml set ai
autocmd FileType javascript,html,css,php,yaml set sw=2
autocmd FileType javascript,html,css,php,yaml set ts=2
autocmd FileType javascript,html,css,php,yaml set sts=2
autocmd FileType javascript,css,php set textwidth=0
autocmd FileType html,htm,xml,tpl,yaml set textwidth=0


if has('gui_running')
" close The toolbar when use gVim
" close the scrollbar when use gVim
	set lines=63
	set columns=180
	set guioptions-=T
	set guioptions-=l
	set guioptions-=r
	set guioptions-=b

    " Let tablebel show only name of file, not the full path.
    set guitablabel=%t
	" ======================
	" paste from system clipboard
	" =====================
	set clipboard=unnamed
	vnoremap y "+y
	"vnoremap y ygv"+y
	vnoremap Y "+Y
	nnoremap p "+p
	nnoremap P "+P
	nnoremap yy yy"+yy
endif

" ===============
" solarized color
" ===============
set background=light
set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
"colorscheme molokai

" Automatic reloading of .vimrc
" autocmd! bufwritepost .vimrc source %
"
set cursorline

" Use left, right, up, down arrow to modify windows size.
nmap <LEFT> <C-W><
nmap <RIGHT> <C-W>>
nmap <UP> <C-W>+
nmap <DOWN> <C-W>-

" Remove unwanted spaces
map <leader>c :%s/\s\+$//<CR>

" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

map <leader>n <esc>:cn<CR>
map <leader>p <esc>:cp<CR>

" Quicksave command
noremap <Leader>s :update<CR>
vnoremap <Leader>s <C-C>:update<CR>
inoremap <Leader>s <C-O>:update<CR>

" Quick quit command
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
" ========================================
" windows config
" =======================================
map <tab><tab> <C-w>w
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
"map <leader>n <esc>:tabprevious<CR>
"map <leader>m <esc>:tabnext<CR>
map <leader>t <esc>:tabnew<CR>
map <leader>w <esc>:tabclose<CR>

" tab navigation like firefox
"nmap <C-S-tab> :tabprevious<CR>
"nmap <C-tab> :tabnext<CR>
"map <C-S-tab> :tabprevious<CR>
"map <C-tab> :tabnext<CR>
"imap <C-S-tab> <Esc>:tabprevious<CR>i
"imap <C-tab> <Esc>:tabnext<CR>i
"nmap <C-t> :tabnew<CR>
"imap <C-t> <Esc>:tabnew<CR>

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Showing line numbers and length
set number  " show line numbers
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing


" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" some shortcut for myself
" using `less` to open current file, since less is easier to copy from.
nmap <leader>ls <esc>:!less %<CR>

" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
" ===========================================================
" CtriP
" ==========================================================
"
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*.venv/*
set wildignore+=*/coverage/*
set wildignore+=*.testrepository/*
set wildignore+=*.git/*
set wildignore+=*.ropeproject/*
let g:ctrlp_working_path_mode = 2

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
au FileType python map <Leader>g :call RopeGotoDefinition()<CR>
let g:pymode_run = 0
let g:pymode_folding=0
let g:pymode_lint_checker="pyflakes,pep8"
let g:pymode_lint_ignore="N4,E12,E711,E712,E721,E502,E501"
 
let g:pymode_rope_enable_shortcuts=0
let pymode_rope_vim_completion=0
let pymode_rope_extended_complete=0
"let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_goto_def_newwin="new"
let g:pymode_rope_guess_project = 1
let g:pymode_rope = 1


" =============
" tagbar
" =============
let g:tagbar_sort = 0
map <leader>tb :TagbarToggle<cr>
vmap <leader>tb <esc>:TagbarToggle<cr>
imap <leader>tb <esc>:TagbarToggle<cr>

" =============
" NerdTree
" ============
let Tlist_Use_Right_Window = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeIgnore=['.pyc$[[file]]','.gitignore$[[dir]]']
let g:nerdtree_tabs_open_on_gui_startup = 1
map <F5> :NERDTreeToggle<cr>
vmap <F5> <esc>:NERDTreeToggle<cr>
imap <F5> <esc>:NERDTreeToggle<cr>
map <leader>nt :NERDTreeToggle<cr>
vmap <leader>nt <esc>:NERDTreeToggle<cr>
imap <leader>nt <esc>:NERDTreeToggle<cr>

" =================
" EasyMotion
" ================
map <leader>a <leader><leader>w


" ================
" CCTree
" ================
let g:CCTreeKeyHilightTree = ''
let g:CCTreeKeyTraceForwardTree = '<C-c>>'
let g:CCTreeKeyTraceReverseTree = '<C-c><'
let g:CCTreeKeyDepthPlus = '<C-c>]'
let g:CCTreeKeyDepthMinus = '<C-c>['
let g:CCTreeMinVisibleDepth = 2
map <leader>l <esc>:CCTreeLoadDB cscope.out<cr>


" set default ctrlp to ctrlpMixed
" map <c-p> at last to override CCtree mapping
map <c-p> :CtrlPMixed<CR>
map <c-i> :CtrlPBuffer<CR>

" indentLine
let g:indentLine_fileTypeExclude = ['html', 'htm']

"==================
" vim-go
"==================
au FileType go nmap <Leader>g <Plug>(go-def)
au FileType go nmap <Leader>gs <Plug>(go-def-split)
au FileType go nmap <Leader>gv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gt <Plug>(go-def-tab)

"==============
" vim-markdown
"==============
let g:vim_markdown_folding_disabled = 1
