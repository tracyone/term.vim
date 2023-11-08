# term.vim

Terminal manager for (neo)vim

# Feature:

1. Multiple terminal support
2. Support opening the terminal in a floating window, horizontal split window, vertical split window, and tab.
3. When multiple terminals are opened, you can use fzf, ctrlp, LeaderF, or vim-clap to quickly select and jump to a specific terminal, with support for previewing the current output of the terminal.
4. Support opening files using the current Vim.
5. Support change the title of terminal win(only in vim)
6. Support sending command to terminal win(REPL). Lunch fuzzy finder to select terminal if there are multiple terminal
7. Support moving the position of the floating window.
8. Seamless switching between Vim and Tig
8. Seamless switching between Vim and Ranger


# Default keymapping

NOTE:
- 'n' represents normal mode
- `t` represents terminal mode

mode  |      key | description
----  |     ---- | -----------
n | `<leader>af` | open a new terminal in floating window
n | `<leader>as` | open a new terminal in split window
n | `<leader>av` | open a new terminal in vertical split window
n | `<leader>at` | open a new terminal in tab window
n | `<leader>jt` | open last hide terminal window
n | `<leader>jf `| Lunch fuzzy finder to select terminal win
n & t | `alt-h` | jump to left win (terminal win or normal win)
n & t | `alt-l` | jump to right win (terminal win or normal win)
n & t | `alt-j` | jump to up win (terminal win or normal win)
n & t | `alt-k` | jump to down win (terminal win or normal win)
 t | `<Ctrl-w>q` | hide terminal win
 t | `<Ctrl-w>a` | create a new terminal win
 t | `<Ctrl-w>h` | move terminal win to left side(only in floating win)
 t | `<Ctrl-w>l` | move terminal win to right side(only in floating win)
 t | `<Ctrl-w>j` | move terminal win to bottom side(only in floating win)
 t | `<Ctrl-w>k` | move terminal win to top side(only in floating win)
 t | `<Ctrl-w>m` | move terminal win to middle(only in floating win)
 t | `<Ctrl-w>n` | switch to next terminal win
 t | `<Ctrl-w>p` | switch to previous terminal win
 t | `<Ctrl-w>r` | rename the terminal
 t | `<Ctrl-w>t` | move current terminal win to a new tab
 t | `<Ctrl-w>s` | move current terminal win to a split window
 t | `<Ctrl-w>v` | move current terminal win to a vertical split window
 t | `<Ctrl-w>f` | move current terminal win to a floating window
 t | `<Ctrl-w><tab>` | jump to last terminal win
 n | `<leader>tr` | send current line to terminal win, lunch fuzzy finder if possible
 n | `<leader>ta` | send current file to terminal win, lunch fuzzy finder if possible
 n | `<leader>re` | open repl window for current filetype
 n | `<leader>rr` | open ranger window
 n | `<leader>rt` | open tig window
 n | `<leader>rg` | open tig status window
 n | `<Ctrl-v>` | paste

# Custom key mapping

Put following line into your vimrc

```
let g:term_vim_no_default_key_mappings = 1
```

Then reference [plugin/term.vim#L39-L91](https://github.com/tracyone/term.vim/blob/main/plugin/term.vim#L39-L91), copy these lines to your vimrc, change keymap whatever you like.

# minimal vimrc

I provide a minimal vimrc for using this plugin.

```
git clone https://github.com/tracyone/term.vim
cd term.vim
vim -u minimal_vimrc.vim
```

You can use this minimal vimrc to reproduce the issue, if you find one.


