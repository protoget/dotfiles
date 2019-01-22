source $HOME/.dotfiles/.vimrc.vundle
let vim_private_path = expand($HOME . '/.dotfiles/.vimrc.private')
if filereadable(vim_private_path)
  source $HOME/.dotfiles/.vimrc.private
endif

set number
set relativenumber

syntax on
filetype plugin indent on

set ignorecase
set term=xterm-256color
set mouse=a
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

" keybinding for inserting time in the following format:
" 2019-01-21 13:12:30
nmap <F3> i<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M %S")<CR>

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

" vimwiki
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown'}
" helppage -> :h wimwiki-syntax

" vim-instant-markdown
" https://github.com/suan/vim-instant-markdown
let g:instant_markdown_autostart = 0  " disable autostart
" <leader> is the backslash key. Here <leader>md is \md
map <leader>md :InstantMarkdownPreview<CR>
