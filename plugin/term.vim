"author:https://github.com/tracyone
"
call term#meta#init()
let $PATH = fnamemodify(expand('<sfile>'), ':p:h').'/../bin:'.$PATH

" my faviorte colors
hi def term_warn cterm=bold ctermfg=121 gui=bold guifg=#fabd2f
hi def term_info cterm=bold ctermfg=118 gui=bold guifg=#A6E22E
hi def term_border cterm=bold ctermfg=118 gui=bold guifg=#665c54

if term#env#IsVim8()
    let g:term_number=v:t_number
    let g:term_string=v:t_string
    let g:term_func=v:t_func
    let g:term_list=v:t_list
    let g:term_dict=v:t_dict
    let g:term_float=v:t_float
    let g:term_bool=v:t_bool
    let g:term_none=v:t_none
    let g:term_job=v:t_job
    let g:term_channel=v:t_channel
    set termwinkey=<c-y>
else
    let g:term_number=0
    let g:term_string=1
    let g:term_func=2
    let g:term_list=3
    let g:term_dict=4
    let g:term_float=5
    let g:term_bool=6
    let g:term_none=7
    let g:term_job=8
    let g:term_channel=9
endif

command! -nargs=* -range T call term#terminal#send(<range>, <line1>, <line2>, <q-args>)

if get(g:, 'term_vim_no_default_key_mappings', 0) == 0
    nnoremap  <silent><leader>jf :call term#terminal#jump_to_floating_win(-4)<cr>
    nnoremap  <silent><leader>jt :call term#terminal#jump_to_floating_win(-3)<cr>
    nnoremap  <silent><leader>j0 :call term#terminal#jump_to_floating_win(0)<cr>
    nnoremap  <silent><leader>j1 :call term#terminal#jump_to_floating_win(1)<cr>
    nnoremap  <silent><leader>j2 :call term#terminal#jump_to_floating_win(2)<cr>
    nnoremap  <silent><leader>j3 :call term#terminal#jump_to_floating_win(3)<cr>
    nnoremap  <silent><leader>j4 :call term#terminal#jump_to_floating_win(4)<cr>
    nnoremap  <silent><leader>j5 :call term#terminal#jump_to_floating_win(5)<cr>
    nnoremap  <silent><leader>j6 :call term#terminal#jump_to_floating_win(6)<cr>
    nnoremap  <silent><leader>j7 :call term#terminal#jump_to_floating_win(7)<cr>
    nnoremap  <silent><leader>j8 :call term#terminal#jump_to_floating_win(8)<cr>
    nnoremap  <silent><leader>j9 :call term#terminal#jump_to_floating_win(9)<cr>
    nnoremap  <silent><leader>rr :call term#terminal#start_ranger()<cr>
    nnoremap  <silent><leader>rt :call term#terminal#shell_pop({'opener':0x4, 'cmd':'tig'})<cr><cr>
    nnoremap  <silent><leader>rg :call term#terminal#shell_pop({'opener':0x2, 'cmd':'tig status'})<cr><cr>
    tnoremap <silent><Esc><Esc> <C-\><C-n>
    tnoremap  <silent><c-w>q <C-\><C-n>:call term#terminal#hide_popup()<cr>
    "previous terminal
    tnoremap  <silent><c-w>p <C-\><C-n>:call term#terminal#jump_to_floating_win(-1)<cr>
    "next terminal
    tnoremap  <silent><c-w>n <C-\><C-n>:call term#terminal#jump_to_floating_win(-2)<cr>
    tnoremap  <silent><c-w>w <C-\><C-n>:call term#terminal#jump_to_floating_win(-2)<cr>
    "start fuzzy finder to select terminal
    tnoremap  <silent><c-w><space> <C-\><C-n>:call term#terminal#jump_to_floating_win(-4)<cr>
    "new terminal
    tnoremap  <silent><c-w>a <C-\><C-n>:call term#terminal#jump_to_floating_win(-5)<cr>
    "last open
    tnoremap  <silent><c-w><tab> <C-\><C-n>:call term#terminal#jump_to_floating_win(-3)<cr>
    "rename terminal
    tnoremap  <silent><c-w>r <C-\><C-n>:call term#terminal#rename()<cr>
    "move terminal
    tnoremap <silent><c-w>h <C-\><C-n>:call term#terminal#move_floating_win("left")<cr>
    tnoremap <silent><c-w>l <C-\><C-n>:call term#terminal#move_floating_win("right")<cr>
    tnoremap <silent><c-w>j <C-\><C-n>:call term#terminal#move_floating_win("bottom")<cr>
    tnoremap <silent><c-w>k <C-\><C-n>:call term#terminal#move_floating_win("top")<cr>
    tnoremap <silent><c-w>m <C-\><C-n>:call term#terminal#move_floating_win("middle")<cr>
    tnoremap <silent><c-w>t <C-\><C-n>:call term#terminal#switch_opener({'opener':0x4})<cr>
    tnoremap <silent><c-w>v <C-\><C-n>:call term#terminal#switch_opener({'opener':0x8})<cr>
    tnoremap <silent><c-w>s <C-\><C-n>:call term#terminal#switch_opener({'opener':0x1})<cr>
    tnoremap <silent><c-w>f <C-\><C-n>:call term#terminal#switch_opener({'opener':0x2})<cr>
    vnoremap <silent><leader>tr :T<cr>
    nnoremap <silent><leader>re :call term#terminal#repl()<cr>
    nnoremap <silent><leader>tr :execute line(".")."T"<cr>
    nnoremap <silent><leader>ta :1,$T<cr>
    " Open vimshell or neovim's emulator in split window
    noremap <silent> <F4> :call term#terminal#shell_pop({'opener':0x1})<cr>
    nnoremap <silent> <Leader>as :call term#terminal#shell_pop({'opener':0x1})<cr>
    " Open vimshell or neovim's emulator in vertical window
    nnoremap <silent> <Leader>av :call term#terminal#shell_pop({'opener':0x8})<cr>
    " Open vimshell or neovim's emulator in floating window
    nnoremap <silent> <Leader>af :call term#terminal#shell_pop({'opener':0x2})<cr>
    " Open vimshell or neovim's emulator in new tab
    nnoremap <silent> <Leader>at :call term#terminal#shell_pop({'opener':0x4})<cr>
endif

if term#env#IsNvim() != 0
    autocmd TermOpen * :startinsert
    tnoremap  <silent><c-w>d <C-\><C-n>:call term#terminal#hide_all()<cr>
    nnoremap <silent><c-w>d :call term#terminal#hide_all()<cr>
    "terminal-emulator setting
    execute 'tnoremap <A-h> <C-\><C-n>G<C-w>h'
    execute 'tnoremap <A-j> <C-\><C-n>G<C-w>j'
    execute 'tnoremap <A-k> <C-\><C-n>G<C-w>k'
    execute 'tnoremap <A-l> <C-\><C-n>G<C-w>l'
    silent! execute 'tmap <c-v> <C-\><C-n>""pa'
elseif term#env#SupportTerminal()
    "terminal-emulator setting
    "execute 'tnoremap <Esc> <C-\><C-n>' "effect <a-> key?
    call term#meta#map('tmap <silent> ','h',term#env#get_termwinkey().'h')
    call term#meta#map('tmap <silent> ','j',term#env#get_termwinkey().'j')
    call term#meta#map('tmap <silent> ','k',term#env#get_termwinkey().'k')
    call term#meta#map('tmap <silent> ','l',term#env#get_termwinkey().'l')
    silent! execute 'tnoremap <c-v> '.term#env#get_termwinkey().'""'
    call term#meta#map('tnoremap <silent> ','b','<C-left>')
    call term#meta#map('tnoremap <silent> ','f','<C-right>')
endif
"move between windows
call term#meta#map('nnoremap','h','  <C-w>h')
call term#meta#map('nnoremap','l','<C-w>l')
call term#meta#map('nnoremap','j','<C-w>j')
call term#meta#map('nnoremap','k','<C-w>k')


