syntax on

set nocompatible

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set scrolloff=3
set ttyfast

set wrap
set linebreak

set cursorline
set cursorcolumn

set showmatch
set errorbells
set visualbell

set relativenumber number
set numberwidth=4
set ruler
set showtabline=2
set showcmd
set showmode

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set tabstop=4
set softtabstop=4

set hlsearch
set smartcase
set ignorecase
set incsearch

" Show matching parentheses
set showmatch
set backspace=indent,eol,start
set nobackup
set background=dark

" Set color scheme
set t_Co=256
colorscheme desert

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Install and enable plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin()

" Install and enable NERDTree plugin
Plug 'scrooloose/nerdtree'

" Install and enable vim-airline plugin
Plug 'vim-airline/vim-airline'

" Install and enable vim-fugitive plugin
Plug 'tpope/vim-fugitive'

" Enable mouse support
"set mouse=a

call plug#end()

" Run :PlugInstall in Vim after adding your plugins to install them

nmap <F2> :NERDTreeToggle<CR>
set guitablabel=(%N)\ %t\ %M
