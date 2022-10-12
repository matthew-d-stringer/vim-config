syntax on

set exrc " Auto sources vimrc in vim dir

" Tab stuff
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Number line
set rnu nu

set nohlsearch " deletes highlight after search

set hidden " keeps buffer open in the background

set noerrorbells

set nowrap

" Keeping history
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set incsearch " highlight as you search

set scrolloff=10 "begins scrolling before you get to the bottem

set noshowmode

set colorcolumn=80
set signcolumn=yes

" Vim-Plug Install

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'gruvbox-community/gruvbox'

call plug#end()

set t_Co=256

colorscheme gruvbox
