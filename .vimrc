source ~/.dotfiles/.vimrc.vundle

set number
set relativenumber

set paste
syntax on
filetype plugin indent on

set ignorecase
set term=xterm-256color
set mouse=
set wildmenu

set ruler
set tw=80
set formatoptions+=t

set showmatch

set hlsearch
set incsearch

" apply the current line indent to the next
set autoindent
" reacts to code syntax
set smartindent
" :help autoindent one value. If set ignore smartindent
" set cindent

" On pressing tab, insert 2 spaces
set expandtab

" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

hi StatusLine ctermbg=58

" vim-airline-themes
" https://github.com/vim-airline
let g:airline_theme='bubblegum'
let g:airline_left_sep          = '⮀'
let g:airline_left_alt_sep      = '⮁'
let g:airline_right_sep         = '⮂'
let g:airline_right_alt_sep     = '⮃'
let g:airline_branch_prefix     = '⭠'
let g:airline_readonly_symbol   = '⭤'
let g:airline_linecolumn_prefix = '⭡'
let g:airline#extensions#tabline#enabled = 1

" scrooloose/nerdtree
" https://github.com/scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>
