" Disable Vi compatability
set nocompatible

filetype on

filetype plugin on

filetype indent on

syntax on
syntax enable
syntax reset

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

set termguicolors

set showmatch
set hlsearch

" Enable autocomplete on : commands
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.img,*.xlsx


" PLUGINS {{{

call plug#begin()

Plug 'doums/darcula'
Plug 'ywjno/vim-tomorrow-theme'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'ap/vim-css-color'

call plug#end()

colorscheme Tomorrow-Night
set laststatus=2
set noshowmode
let g:lightline = { 'colorscheme': 'Tomorrow_Night', }

let g:ale_linters = {'latex': [], 'tex': []}

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

au BufRead * syntax reset
" compile LaTeX
au BufWritePost *.tex {
    execute "!pdflatex <afile>"
    execute "!rm <afile>:r.log"
    execute "!rm <afile>:r.aux"
    execute "!mkdir pdfs"
    execute "!mv <afile>:r.pdf pdfs"
    redraw!
    }

" }}}

" STATUS LINE {{{
" }}}
