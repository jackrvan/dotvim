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

execute pathogen#infect()
let g:DirDiffExcludes = '*mlchar_config*,*metrics*'
let g:airline#extensions#tabline#enabled = 1

nnoremap 0 ^
nnoremap ; :
nnoremap <F7> :tabp<cr>
nnoremap <F8> :tabn<cr>
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
nnoremap c ]c
nnoremap C [c
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

nnoremap <F2> <C-q>:call CommentUncomment()<cr>

command W w
command Wa wa
command Q q
command Qa qa

function! CommentUncomment()
    let first=getline('.')[0]
    if first == "#"
        :.s/^#//g
    else
        :.s/^/#/g
    endif
endfunction

command -nargs=+ DeletePP :call DeletePPFunc(<f-args>)
function DeletePPFunc(...)
    for arg in a:000
        let line_num = search('- post_processor_name: ' . arg)
        if line_num == 0
            continue
        endif
        let end_line = search('- post_processor_name: ')
        if end_line == 0
            let end_line = line('$')
        elseif end_line <= line_num
            let end_line = line('$')
        else
            let end_line = end_line - 1
        endif
        execute line_num.','.end_line.'d'
    endfor
endfunction

