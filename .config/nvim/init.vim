"-vvv- = section separator

"-vvv- Plugins
call plug#begin('~/.vim/plugged')

" color themes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" language packs
Plug 'sheerun/vim-polyglot'

" snippets
Plug 'SirVer/ultisnips'

" markdown syntax
Plug 'plasticboy/vim-markdown'

" number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Text object targets
Plug 'wellle/targets.vim'

" Auto expands current split
Plug 'roman/golden-ratio'

" automatic closing
Plug 'raimondi/delimitmate'

" align
Plug 'junegunn/vim-easy-align'

" trailing spaces and newlines
Plug 'ntpeters/vim-better-whitespace'

" comments
Plug 'scrooloose/nerdcommenter'

" airline
Plug 'vim-airline/vim-airline'

" nerdtree
Plug 'scrooloose/nerdtree'

call plug#end()


"-vvv- Config

set showcmd " display incomplete commands
set showmode " display current mode
set backspace=indent,eol,start " intuitive backspacing

set hidden " handle multiple buffers better
set wildmenu " enhanced command line completion
set wildmode=list:longest " complete files like a shell

set ignorecase " case insensiyive searching
set smartcase " but case sensitive if expression contains capital letter

set number " show line numbers
set relativenumber " relative numbers
set ruler " show cursor position

set incsearch " highlight matches as typing
set nohlsearch " no highlight matches, use <Leader-h> to highlight

" set wrap " turn on line wrapping
set scrolloff=4 " show 3 lines of context around cursor

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" don't make a backup before overwriting a file
set nobackup
set nowritebackup

" splits
set splitbelow  " open a new vertical split below
set splitright  " open a new horizontal split on the right


"-vvv- Key maps

" space key as leader
let mapleader = "\<Space>"
" upperleft key on magic keyboard
nmap § $
" Ctrl-S write file
nmap <C-S> :w<CR>
imap <C-S> <esc>:w<CR>
" quick and dirty exit insert mode
imap jk <esc>
imap kj <esc>
" navigate splits
nnoremap <C-h> <C-w>h  " Ctrl-h move to left split
nnoremap <C-l> <C-w>l  " Ctrl-l move to right split
" `q` to close the buffer for help files, just current <buffer>
autocmd Filetype help nnoremap <buffer> q :q<CR>
" no search highlights
nmap <Leader>h :nohls<CR>
" NerdTree
nmap <Leader>o :NERDTree<CR>


"-vvv- Neovim

" python3
let g:python3_host_prog = '/usr/local/bin/python3'


"-vvv- Plugins config

" markdown
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

" whitespace
" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" strip white lines at the end of the file when stripping whitespace
let g:strip_whitelines_at_eof=1

" NerdTree
let NERDTreeShowHidden=1  " always show dot files
let NERDTreeQuitOnOpen=1  " quit after open

" airline
let g:airline_theme='onedark'


"-vvv- Colors

" colorscheme dracula
" brighter white
let g:onedark_color_overrides = {
\ "white": {"gui": "eeeeee", "cterm": "255", "cterm16": "7" }
\}
colorscheme onedark
" let g:lightline.colorscheme='onehalfdark'
set background=dark
