" Load pathogen plugins
execute pathogen#infect()

filetype on
filetype plugin on
syntax on
colorscheme brogrammer

" Add code length limit column
set colorcolumn=80

" Add line numbers
set number

" Make <leader>s reload .vimrc
map <silent> <leader>s :source ~/.vimrc<CR>

set hidden
set history=100

" Add some indentation logic
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

" Turn search highlights on
set hlsearch

" Highlight matching parentheses
set showmatch

" Clears search highlights with <leader>c
map <silent> <leader>c :nohl<CR>

" Self explanatory
filetype plugin on


"""""" NerdTree
" Hit the right arrow to open a node:
let NERDTreeMapActivateNode='<right>'

" Display hidden files:
let NERDTreeShowHidden=1

" Toggle display of the tree with <Leader> + n:
nmap <leader>n :NERDTreeToggle<CR>

" Locate the focused file in the tree with <Leader> + j:
nmap <leader>j :NERDTreeFind<CR>

" Always open the tree when booting Vim, but don’t focus it:
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

" Do not display some useless files in the tree:
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp']
