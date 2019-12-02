" Leo vim config

set nocompatible
syntax enable
" filetype plugin indent on " turn on file type detection

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

" --- Plugins
" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
source ~/.vim/plugins.vim

" fix lightline plugin
set laststatus=2
" fix lightline delay when exit insert mode
set ttimeout ttimeoutlen=10
" lightline setup
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ }

" nerdtree shortcut
map <C-o> :NERDTreeToggle<CR>

" --- Colors "
" colorscheme dracula
colorscheme onedark
" let g:lightline.colorscheme='onehalfdark'

