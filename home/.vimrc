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

set notermguicolors

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
Plug 'jeffkreeftmeijer/vim-dim'
Plug 'mbbill/undotree'

call plug#end()

colorscheme trim
" colorscheme dim
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

nnoremap <leader>u :UndotreeToggle<CR>

" compile LaTeX
function! CompileLatex(cleanup)
    let l:file = expand('%')
    let l:base = expand('%:r')
    let l:cmd = 'lualatex -interaction=nonstopmode ' . l:file

    echo "Compiling..."

    let l:Callback = {job, status -> s:OnCompileDone(status, l:base, a:cleanup)}
    call job_start(['sh', '-c', l:cmd], {'exit_cb': l:Callback, 'out_io': 'null', 'err_io': 'null'})
endfunction

function! s:OnCompileDone(status, base, cleanup)
    if a:status != 0
        echohl ErrorMsg | echo "LaTeX compile FAILED (exit " . a:status . ")" | echohl None
    else
        if a:cleanup
            call system('rm -f ' . a:base . '.log ' . a:base . '.aux')
        endif
        call system('mkdir -p pdfs && mv ' . a:base . '.pdf pdfs/')
        echo "Compiled OK -> pdfs/" . fnamemodify(a:base, ':t') . ".pdf"
    endif
endfunction

nnoremap <leader>cc :call CompileLatex(1)<CR>
nnoremap <leader>c  :call CompileLatex(0)<CR>

" }}}

" VIMSCRIPT {{{

" Enable code folding
set foldlevel=99
set foldmethod=indent
autocmd FileType vim setlocal foldmethod=marker
" za to toggle, zo to open, zc to close. zM/zR to close/open all folds
set foldcolumn=2

au BufRead * {
    syntax on
    syntax enable
    colorscheme trim
}

" }}}

" STATUS LINE {{{
" }}}
