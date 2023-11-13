" usage:
" First:
" cd to root of term.vim
" Second:
" vim -u minimal_vimrc.vim
" Third:
" press <Space>af to open a terminal in floating window
" press <C-w>r to name this terminal
" press <C-w>q to hide it
" press <Space>af to open another terminal
" press <C-w>p to switch between multiple terminal
" Fourth:
" Modify this file, specify the path of fzf and fzf.vim to runtimepath
" Start from first step and hide all terminal
" press <Space>jf to select terminal from fzf window
"
set nocompatible

execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h')

"let g:term_vim_no_default_key_mappings = 1

let g:mapleader="\<Space>"
let g:maplocalleader=','

set timeout
set ttimeoutlen=100

"fzf
"execute 'set runtimepath+='.'~/.fzf'
"execute 'set runtimepath+='.$HOME.'/.vim/bundle/fzf.vim'

"ctrlp
"execute 'set runtimepath+='.$HOME.'/.vim/bundle/ctrlp.vim'

"Leaderf
"execute 'set runtimepath+='.$HOME.'/.vim/bundle/LeaderF'

"vim-clap
"execute 'set runtimepath+='.$HOME.'/.vim/bundle/vim-clap'

filetype plugin indent on
syntax on
syntax enable
set background=dark
set termguicolors
colorscheme default
set t_Co=256

