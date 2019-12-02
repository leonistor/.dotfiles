" Plugins
call plug#begin('~/.vim/plugged')

" color themes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" language packs
Plug 'sheerun/vim-polyglot'

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

" indent guides
" Plug 'yggdroot/indentline'

" align
Plug 'junegunn/vim-easy-align'

" comments
Plug 'scrooloose/nerdcommenter'

" lightline
" Plug 'itchyny/lightline.vim'

" nerdtree
Plug 'scrooloose/nerdtree'

call plug#end()


" Config

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
set hlsearch " highlight matches

" set wrap " turn on line wrapping
set scrolloff=3 " show 3 lines of context around cursor

" tabs
set tabstop=4
set shiftwidth=4
set expandtab

" set the terminal's title
" set title
" no beeping: handled by iTerm on mac
" set visualbell

" don't make a backup before overwriting a file
set nobackup
set nowritebackup
" keep swap files in one location
" set directory=$HOME/.vim/tmp//,.

" splits
set splitbelow  " open a new vertical split below
set splitright  " open a new horizontal split on the right
" navigate splits
nnoremap <C-h> <C-w>h  " Ctrl-h move to left split
nnoremap <C-l> <C-w>l  " Ctrl-l move to right split


" Plugins config

" markdown
let g:vim_markdown_folding_disabled = 1
set conceallevel=2

" fix lightline plugin
" set laststatus=2
" fix lightline delay when exit insert mode
" set ttimeout ttimeoutlen=10
" lightline setup

" NerdTree
let NERDTreeShowHidden=1  " always show dot files
let NERDTreeQuitOnOpen=1  " quit after open
map <C-o> :NERDTreeToggle<CR>


" Colors

" colorscheme dracula
" brighter white
let g:onedark_color_overrides = {
\ "white": {"gui": "eeeeee", "cterm": "255", "cterm16": "7" }
\}
colorscheme onedark
" let g:lightline.colorscheme='onehalfdark'
set background=dark

