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
vnoremap d "_d
set hlsearch
hi Search ctermbg=Yellow
hi Search ctermfg=DarkRed
set novisualbell
set updatetime=100
set foldmethod=indent
set foldlevelstart=20
let g:airline#extensions#tabline#enabled = 1
set relativenumber
set tabstop=8
set softtabstop=0 expandtab
set shiftwidth=4 smarttab

nnoremap 0 ^
nnoremap ; :
nnoremap <F7> :tabp<cr>
nnoremap <F8> :tabn<cr>
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

nnoremap <F2> <C-q>:call CommentUncomment()<cr>

function! CommentUncomment()
    let first=getline('.')[0]
    if first == "#"
        :.s/^#//g
    else
        :.s/^/#/g
    endif
endfunction

map <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
map <ESC>[1;5B <C-Left>
map <ESC>[1;5A <C-Right>

map! <ESC>[1;5D <C-Left>
map! <ESC>[1;5C <C-Right>
map! <ESC>[1;5B <C-Left>
map! <ESC>[1;5A <C-Right>

execute pathogen#infect()

command W w
command Wa wa
command Q q
command Qa qa

