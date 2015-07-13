set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'ciaranm/detectindent'
Plugin 'ntpeters/vim-better-whitespace'
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
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
syntax on
:autocmd BufReadPost * :DetectIndent
:let g:detectindent_preferred_indent = 4
