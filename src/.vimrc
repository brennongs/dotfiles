set number
set nocompatible
set shiftwidth=2
set tabstop=2
set expandtab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set history=1000
set ttimeout
set ttimeoutlen=1
set ttyfast
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
au BufWinLeave * mkview
au BufWinEnter * silent loadview

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'chr4/nginx.vim'
Plug 'leafgarland/typescript-vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'ap/vim-css-color'
Plug 'w0ng/vim-hybrid'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ryanoasis/vim-devicons'
call plug#end()

filetype on
filetype plugin on
filetype indent on

syntax on
colorscheme hybrid

nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-s> :Rg<CR>

