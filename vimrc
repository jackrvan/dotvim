""""""""""
" Settings
""""""""""
set number   
syntax on
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set title
set autoindent
set ignorecase
filetype plugin on
filetype indent plugin on
set clipboard=unnamedplus
set hlsearch
hi Search ctermbg=White
hi Search ctermfg=DarkRed
set novisualbell
set updatetime=100
set foldmethod=indent
set foldlevelstart=20
set relativenumber
set tabstop=8
set softtabstop=0 expandtab
set shiftwidth=4 smarttab
set showbreak=------>

"""""""""
" Plugins
"""""""""
execute pathogen#infect()
let g:DirDiffExcludes = '*mlchar_config*,*metrics*,*database*,*.db*'
let g:airline#extensions#tabline#enabled = 1
set wildignore+=*/darth/test-objects/*
set wildignore+=*/darth/results/*
set wildignore+=*/.git/*
set wildignore+="*.pyc
set nocst

"set runtimepath-=~/.vim/bundle/csv.vim
"set runtimepath-=~/.vim/bundle/ctrlp.vim
"set runtimepath-=~/.vim/bundle/nerdtree
"set runtimepath-=~/.vim/bundle/vim-airline
"set runtimepath-=~/.vim/bundle/vim-dirdiff
"set runtimepath-=~/.vim/bundle/vim-startify

""""""
" Maps
""""""
nnoremap 0 ^
nnoremap ; :
nnoremap <F3> :bp<cr>
nnoremap <F4> :bn<cr>
nnoremap <F7> :tabp<cr>
nnoremap <F8> :tabn<cr>
nnoremap <F12> <Esc>/^[a-z_]\+_parsers\?=<CR>
nnoremap <leader>d "_d
nnoremap c ]c
nnoremap C [c
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za
nnoremap <S-F> :CtrlP<CR>
nnoremap bn :bn<cr>
nnoremap bp :bp<cr>
nnoremap <leader>d "_d
nnoremap <leader>p "_dP

inoremap <C-F> <C-X><C-F>
inoremap qq <Esc>

vnoremap d "_d

command W w
command Wa wa
command Q q
command Qa qa
command DarthLogCleanup g/debug\| memory /d


"""""""""""
" Functions
"""""""""""
nnoremap <F2> :call CommentUncomment()<cr>
function! CommentUncomment()
    let first=getline('.')[0]
    if first == "#"
        :.s/^#//g
    else
        :.s/^/#/g
    endif
endfunction

command -nargs=0 WhatCell :call GetCell()
function! GetCell()
    let temp = search('cell \?(.*)', 'bn')
    if temp <= line('.')
        echo getline(temp)
    else
        echo "None"
    endif
endfunction
