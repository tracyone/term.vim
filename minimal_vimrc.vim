" usage:
" First:
" cd to root of term.vim
" Second:
" vim -u minimal_vimrc.vim
" Third:
" press <Space>af to open a terminl in floating window
" press <C-w>q to hide it
" press <Space>af to open another hide terminl
" press <C-w>p to switch between multiple terminal
" Fourth:
" Modify this file, specify the path of fzf and fzf.vim
" Start from first step and hide all terminal
" press <Space>jf to select terminal from fzf window
"
set nocompatible

execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h')
"fzf
"execute 'set runtimepath+='.'~/.fzf'
"execute 'set runtimepath+='.fnamemodify(expand('<sfile>'), ':p:h').'/bundle/fzf.vim'
let g:mapleader="\<Space>"
let g:maplocalleader=','

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

