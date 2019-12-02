" Specify a directory for plugins
" Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" color themes
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'joshdick/onedark.vim'

" language packs
Plug 'sheerun/vim-polyglot'

" markdown syntax
Plug 'plasticboy/vim-markdown'

" number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" automatic closing
Plug 'raimondi/delimitmate'

" indent guides
Plug 'yggdroot/indentline'

" align
Plug 'junegunn/vim-easy-align'

" comments
Plug 'scrooloose/nerdcommenter'

" lightline
Plug 'itchyny/lightline.vim'

" nerdtree
Plug 'scrooloose/nerdtree'

" Initialize plugin system
call plug#end()

