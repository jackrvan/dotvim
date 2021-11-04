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
set nomodeline

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

cnoreabbrev Ack Ack!

"""""""""
" Plugins
"""""""""
execute pathogen#infect()
"let g:DirDiffExcludes = ''
let g:airline#extensions#tabline#enabled = 1
set wildignore+=*/.git/*
set wildignore+="*.pyc
set nocst
set rtp+=/home/jack/apps/fzf
let g:pydocstring_templates_path = '/home/jack/.vim/template'
let g:pydocstring_doq_path = '/home/jack/.local/bin/doq'
"let g:pydocstring_formatter = 'jacks_template'
let g:python3_host_prog = '/home/jack/venv/nvim/bin/python'

"set runtimepath-=~/.vim/bundle/csv.vim
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
nnoremap <F7> :bp<cr>
nnoremap <F8> :bn<cr>
nnoremap <leader>d "_d
nnoremap c ]c
nnoremap C [c
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <space> za
nnoremap <C-p> :Files<CR>
nnoremap bn :w<cr>:bn<cr>
nnoremap bp :w<cr>:bp<cr>
nnoremap <leader>d "_d
nnoremap <leader>p "_dP

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-d> :Pydocstring<CR>

inoremap <C-F> <C-X><C-F>
inoremap qq <Esc>

vnoremap d "_d

map <leader>r :NERDTreeFind<cr>

command W w
command Wa wa
command Q q
command Qa qa
command BE BufExplorer


"""""""""""
" Functions
"""""""""""
nnoremap <F2> :call CommentUncomment()<cr>
function! CommentUncomment()
    let first_nonwhite=match(getline('.'),'\S')
    if first_nonwhite != -1
        let first_char=getline('.')[first_nonwhite]
        if first_char == "#"
            :.s/# //
        else
            :.s/\(\S\)/# \1/
        endif
    endif
endfunction

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
