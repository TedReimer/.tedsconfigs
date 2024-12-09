" Disable Vi compatability
set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on

" Turns on relative line numbering, except current line
set number
set relativenumber

set cursorline

" Tab stuff
set expandtab
set shiftwidth=4
set tabstop=4

set scrolloff=8

set nobackup

set incsearch
set ignorecase
" Searching for lower case will include capital, but not vice versa
set smartcase

set showmode

" Not sure why but it doesn't look right if I don't load pablo first
colorscheme pablo
colorscheme retrobox
set termguicolors

set showmatch
set hlsearch

" Enable autocomplete on : commands
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.img,*.xlsx


" PLUGINS {{{
" }}}

" MAPPINGS {{{

let mapleader=" "

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>fv :E<CR>

nnoremap <leader><Esc> :noh<CR>


" }}}

" VIMSCRIPT {{{

" Enable code folding
set foldlevel=99
set foldmethod=indent
autocmd FileType vim setlocal foldmethod=marker
" za to toggle, zo to open, zc to close. zM/zR to close/open all folds
set foldcolumn=2

" compile LaTeX
"autocmd BufWritePost *.tex silent! execute "!pdflatex % " | redraw!
au BufWritePost *.tex {
    execute "!pdflatex <afile>"
    execute "!rm <afile>:r.log"
    execute "!rm <afile>:r.aux"
    execute "!mv <afile>:r.pdf pdfs"
    redraw!
    }

" }}}

" STATUS LINE {{{
" }}}
