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

call plug#end()

set t_Co=256

colorscheme gruvbox
set bg=dark

" Block Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup mycmds
au!
autocmd vimenter * silent !echo -ne "\e[2 q"
augroup END

" FZF config

" Ctrl-P to open files
" noremap <C-p> :Files %:p:h<Cr> 
noremap <C-p> :Files <Cr> 

" Ctrl-B to open files
noremap <C-b> :Buffers<Cr> 

let g:toggle_term = "<C-j>"

let g:term_buf_nr = -1
function! ToggleTerminal()
    if g:term_buf_nr == -1
        execute "bot term"
        let g:term_buf_nr = bufnr("$")
    else
        execute "bd! " .g:term_buf_nr
        let g:term_buf_nr = -1
    endif
endfunction

" execute "nnoremap ".g:toggle_term ." :call ToggleTerminal()<CR>"
execute "tnoremap ".g:toggle_term ." <C-W>:call ToggleTerminal()<CR>"

command! -nargs=? Vmake :vertical terminal make <args>


