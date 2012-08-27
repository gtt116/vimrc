" vimrc of gtt116

" Enable syntax highlighting
syntax on
set encoding=utf-8
let mapleader = ","
set guifont=DejaVu\ Sans\ Mono\ 10
" ================
" Init pathogen
" ================
call pathogen#infect()
call pathogen#helptags()
filetype off
filetype plugin indent on

" close The toolbar when use gVim
" close the scrollbar when use gVim
if has('gui_running')
	set lines=63
	set columns=180
	set guioptions-=T
	set guioptions-=l
	set guioptions-=r
	set guioptions-=b
"	set guioptions-=m

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

set background=light
set t_Co=256
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
set cursorline


" Keep search pattern at the center of sreen
"nnoremap <silent> n nzz
"nnoremap <silent> N Nzz
"nnoremap <silent> * *zz
"nnoremap <silent> # #zz
"nnoremap <silent> g* g*zz

" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


" Quicksave command
noremap <C-s> :update<CR>
vnoremap <C-s> <C-C>:update<CR>
inoremap <C-s> <C-O>:update<CR>

" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows


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
nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
"" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"" au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
"" color wombat256mod





" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=80
"highlight ColorColumn ctermbg=233
set colorcolumn=80


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


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
set wildignore+=*/coverage/*
let g:ctrlp_working_path_mode = 2

" Settings for python-mode
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_doc = 0
"let g:pymode_run = 0
"let g:pymode_lint = 0
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
let g:pymode_folding = 0
"let g:pymode_rope_goto_def_newwin = "new"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_rope_vim_completion=1
"let g:pymode_rope_enable_autoimport = 0
"let g:pymode_options_indent = 1
"let g:pymode_rope_guess_project = 0
" Close rope, because I don't know if is it to slow down my Vim.!!!
"let g:pymode_rope = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" =============
" tagbar
" =============
map <F6> :TagbarToggle<cr>
vmap <F6> <esc>:TagbarToggle<cr>
imap <F6> <esc>:TagbarToggle<cr>
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

" ===============
" indent guide
" ===============
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1
