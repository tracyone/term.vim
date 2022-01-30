set nocompatible

execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h')
"fzf
execute 'set runtimepath+='.'~/.fzf'
execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h').'/bundle/fzf.vim'

"ctrlp
"execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h').'/bundle/ctrlp.vim'
"
"Leaderf
"execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h').'/bundle/LeaderF'

filetype plugin indent on
syntax on
syntax enable
set background=dark
set termguicolors
colorscheme default
set t_Co=256

