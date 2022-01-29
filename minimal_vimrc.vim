set nocompatible

execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h')
"fzf
"execute 'set runtimepath+='.'~/.fzf'
"execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h').'/bundle/fzf.vim'

"ctrlp
"execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h').'/bundle/ctrlp.vim'
"
"Leaderf
execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h').'/bundle/LeaderF'

set timeout timeoutlen=1000 ttimeoutlen=100
let g:mapleader="\<Space>"
let g:maplocalleader=','

filetype plugin indent on
syntax on
syntax enable
set background=dark
set termguicolors
colorscheme default
set t_Co=256

