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
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'lervag/vim-latex'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'spf13/snipmate-snippets'
Plugin 'myusuf3/numbers.vim'
Plugin 'fatih/vim-go'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'mileszs/ack.vim'

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
"set expandtab
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

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

" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40

" Golang mode
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>s <Plug>(go-implements)

" Nerd tree plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" Ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,__pycache__

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Tabularize
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Ag. The Silver Searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
