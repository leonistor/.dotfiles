" ---
call plug#begin('~/.vim/plugged')

" color themes
Plug 'joshdick/onedark.vim'

" language packs
Plug 'sheerun/vim-polyglot'

" snippets
" Plug 'SirVer/ultisnips'
" https://www.chrisatmachine.com/Neovim/17-snippets/
Plug 'honza/vim-snippets'

" elixir
Plug 'elixir-editors/vim-elixir'

" markdown syntax
Plug 'plasticboy/vim-markdown'

" number toggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" show changes in buffer
Plug 'chrisbra/changesPlugin'

" Text object targets
Plug 'wellle/targets.vim'

" Auto expands current split
Plug 'roman/golden-ratio'

" automatic closing
Plug 'raimondi/delimitmate'

" tags and quotes
Plug 'tpope/vim-surround'

" align
Plug 'junegunn/vim-easy-align'

" trailing spaces and newlines
Plug 'ntpeters/vim-better-whitespace'

" comments
Plug 'scrooloose/nerdcommenter'

" airline
Plug 'vim-airline/vim-airline'

" git
Plug 'tpope/vim-fugitive'

" scroll motion
Plug 'yuttie/comfortable-motion.vim'

" file manager: you don't need:
" https://shapeshed.com/vim-netrw/
" see below

" list buffers
Plug 'jeetsukumaran/vim-buffergator'

" startup
Plug 'mhinz/vim-startify'

" za shit: coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


" --- Config

set showcmd " display incomplete commands
set showmode " display current mode
set backspace=indent,eol,start " intuitive backspacing

syntax on
filetype plugin indent on " enable filetype detection
set autoindent

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
set tabstop=2
set shiftwidth=2
set expandtab

" don't make a backup before overwriting a file
set nobackup
set nowritebackup

" splits
set splitbelow  " open a new vertical split below
set splitright  " open a new horizontal split on the right


" --- Key maps

" space key as leader
let mapleader = "\<Space>"

" move forward one full screen
nnoremap <Leader><Space> <C-F>

" Ctrl-S write file
nmap <C-S> :w<CR>
imap <C-S> <esc>:w<CR>

" navigate splits
nnoremap <C-h> <C-w>h  " Ctrl-h move to left split
nnoremap <C-l> <C-w>l  " Ctrl-l move to right split

" `q` to close the buffer for help files, just current <buffer>
autocmd Filetype help nnoremap <buffer> q :q<CR>
" tile vertically
nmap <Leader>vs :vert ba<CR>
" toggle search highlights
nmap <Leader>h :set hls!<CR>

" navigate buffers
" nnoremap <Leader>/ :ls<CR>:b<Space>
nnoremap <silent> <Leader>/ :bnext<CR>

" insert line after in normal mode, blanked if autocomment on
nmap <Leader><CR> o<Esc>d$k
" zoom pane/window
" see https://medium.com/@vinodkri/zooming-vim-window-splits-like-a-pro-d7a9317d40
" zoom +
nnoremap <Leader>z <C-W>_ \| <C-W>\|
" equal size
nnoremap <Leader>Z <C-W>=

" ---- Neovim

" python3
let g:python3_host_prog = '/usr/bin/python3'


" --- Plugins config

" markdown
let g:vim_markdown_folding_disabled = 1
" let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
set conceallevel=2

" whitespace
" enable highlighting and stripping whitespace on save by default
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
" strip white lines at the end of the file when stripping whitespace
let g:strip_whitelines_at_eof=1
" don't use here
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help']
" colors
let g:better_whitespace_ctermcolor='LightYellow'
let g:better_whitespace_guicolor='#FFFACD'

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

" netrw file explorer
nmap <silent> <Leader>o :Vexplore<Enter>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

" startify
" https://www.chrisatmachine.com/Neovim/11-startify/
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'i': '~/.config/nvim/init.vim' },
            \ '~/learn',
            \ '~/src',
            \ '~/work',
            \ ]
let g:startify_session_autoload = 1
let g:startify_files_number = 5
let g:startify_custom_header = [
        \ '   --> Neovim <--',
        \]

" --- coc.vim

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
" set shortmess+=c
" always show signcolumns
set signcolumn=yes

" completion keys
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
let g:coc_snippet_next = '<tab>'

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show doc floating window
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use ? to show documentation in preview window
nnoremap <silent> ? :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" outline
nmap <silent> <Leader>l :CocList outline<CR>

" coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" elixir html templates
au BufRead,BufNewFile *.html.eex set filetype=html


" --- Colors

" colorscheme dracula
" brighter white
let g:onedark_color_overrides = {
\ "white": {"gui": "eeeeee", "cterm": "255", "cterm16": "7" }
\}

set background=dark
colorscheme onedark
