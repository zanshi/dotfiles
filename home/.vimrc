" ~/.vimrc

"execute pathogen#infect()

" Section: Options {{{1
" " ---------------------
"
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"

Plugin 'Lokaltog/vim-easymotion'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'xuhdev/SingleCompile'
Plugin 'kien/ctrlp.vim'

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set omnifunc=syntaxcomplete#Complete

language en_US.utf8
syntax on
set guifont=Inconsolatazi4\ 11

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
" nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)

nmap <F9> :SCCompile<cr>
nmap <F10> :SCCompileRun<cr>
autocmd Filetype c nmap <buffer> <F9> :SCCompileAF -Wall -g -std=c++11 <CR>
autocmd Filetype c nmap <buffer> <F10> :SCCompileRunAF  -Wall -g -std=c++11 <CR>
" " Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

let g:syntastic_cpp_checkers = ['gcc', 'clang_check']
let g:syntastic_cpp_check_header = 1
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

"nnoremap <left> :vertical resize -5<cr>
"nnoremap <right> :vertical resize +5<cr>
"nnoremap <up> :resize +5<cr>
"nnoremap <down> :resize -5<cr>

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
" set background=dark
" set t_Co=256
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set showcmd

set ignorecase
set smartcase       " Case insensitive searches become sensitie with capitals
set smarttab        " sw at the start of the line, sts everywhere else

set incsearch       " Incremental search

set ttimeoutlen=50  " Make Esc work faster

set wildmenu
set wildmode=longest:full,full
set wildignore+=tags,.*.un~,*.pyc

"autocmd vimenter * NERDTree
" colorscheme solarized
"
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

colorscheme molokai
" let g:molokai_original = 1
