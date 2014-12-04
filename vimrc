set nocompatible 
filetype off

" Set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required.
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'flazz/vim-colorschemes'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'lervag/vim-latex'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'spf13/snipmate-snippets'
Plugin 'myusuf3/numbers.vim'

call vundle#end() " required
filetype plugin indent on " required

" Put your non-Plugin stuff after this line.

" Quicker window movement.
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h

set splitbelow
set splitright

let mapleader = ","
set mouse=a

" Colorscheme.
set term=screen-256color
colorscheme Tomorrow-Night
syntax enable

" Show line numers.
set number
nnoremap <F3> :NumbersToggle<CR>

" Redifine tabs as 4 spaces.
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Ruler.
set colorcolumn=81

" Powerline.
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" CtrlP.
set runtimepath^=~/.vim/bundle/ctrlp.vim

" NerdTree.
map <C-n> :NERDTreeToggle<CR>
" Close vim if the only window left open is a NERDTree.
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeWinSize = 18 

" Auto completion.
let g:neocomplcache_enable_at_startup = 1

" Vim-javascript.
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2

" Vim-latex.
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
set grepprg=grep\ -nH\ $*
let g:tex_flavor='vimlatex'

" Unfold at start
set foldlevelstart=1
