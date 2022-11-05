filetype plugin indent on
syntax on
set backspace=indent,eol,start

set mouse=a
set nocompatible

set exrc " Auto sources vimrc in vim dir

nnoremap <buffer> <space> :silent mode <bar> redraw! <CR>

" Tab stuff
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Number line
set rnu nu

"set nohlsearch " deletes highlight after search

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

set colorcolumn=80,100
set signcolumn=yes

" Vim-Plug Install

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'sudar/comments.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'

call plug#end()

set t_Co=256

colorscheme gruvbox
set bg=dark

" Block Cursor
if $TERM == "cygwin"
	let &t_ti.="\e[1 q"
	let &t_SI.="\e[5 q"
	let &t_EI.="\e[1 q"
	let &t_te.="\e[0 q"
else
    let &t_SI = "\e[6 q"
    let &t_EI = "\e[2 q"
endif

" FZF config

" Ctrl-P to open files
" noremap <C-p> :Files %:p:h<Cr> 
noremap <C-p> :Files <Cr> 

" Ctrl-B to open files
noremap <C-b> :Buffers<Cr> 

" Custom compiling and terminal commands to work better with vertical split
function! FuncVTerm(...)
    if a:0 == 0
        execute("vertical terminal")
    else
        execute("vertical terminal ".join(a:000))
    endif
endfunction

command -nargs=* VTerm call FuncVTerm(<f-args>) 

function! FuncVMake(...)
    if a:0 == 0
        execute("VTerm make")
    else
        execute("VTerm make ".join(a:000))
    endif
endfunction

command! -nargs=* VMake call FuncVMake(<f-args>)

packadd termdebug
let g:termdebug_wide=1
