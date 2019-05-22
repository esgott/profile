set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'ciaranm/detectindent'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'fatih/vim-go'
Plugin 'uarun/vim-protobuf'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

set number
set ruler
set laststatus=2
set autoindent
set tabstop=4
set copyindent
set backspace=2
set ignorecase
set smartcase
set hlsearch
set incsearch
set background=dark
set mouse=a
set splitbelow
set splitright
set clipboard=unnamed
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
syntax on
:autocmd BufReadPost * :DetectIndent
:let g:detectindent_preferred_indent = 4
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
nnoremap gf <c-w>gf
map <C-n> :NERDTreeTabsToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

