scriptencoding utf-8

let s:win_list=[]
let s:global_echo_str=[]

function! VimCloseWin(winid, result) abort
    if !empty(s:win_list)
        if a:winid == s:win_list[0].id
            call remove(s:win_list, 0)
        else
            let s:win_list=[]
        endif
    endif
endfunction

function! s:nvim_close_win(timer) abort
    call timer_info(a:timer)
    let l:flag=0
    try
        call nvim_win_close(s:win_list[0].id, v:true)
    catch
        call remove(s:win_list, 0)
        let l:flag=1
    endtry
    if !empty(s:win_list) && l:flag == 0
        call remove(s:win_list, 0)
    endif
endfunction

"echo warning messag
"a:1-->err or warn or info,default is warn
"a:2-->flag of VimEnter,0 or 1
function! term#utils#EchoWarning(str,...) abort
    let l:level='vinux_warn'
    let l:flag=0
    if a:0 != 0
        for s:needle in a:000
            if type(s:needle) == g:t_string
                if s:needle ==? 'err'
                    let l:level='WarningMsg'
                elseif s:needle ==? 'warn'
                    let l:level='vinux_warn'
                elseif s:needle ==? 'info'
                    let l:level='vinux_info'
                endif
            elseif type(s:needle) == g:t_number
                let l:flag=s:needle
            endif
        endfor
    endif
    if l:flag != 0 || has('vim_starting')
        call add(s:global_echo_str, a:str)
        return
    endif

    if term#env#IsNvim() != 0 && term#env#SupportFloatingWindows() == 2
        let l:str= ' '.a:str
        let l:win={}
        let l:bufnr = nvim_create_buf(v:false, v:false)
        if strlen(l:str) > (&columns/3)
            let l:str_len = &columns/3
            let l:win.str_width = strlen(l:str) / (&columns/3)
            if (strlen(l:str) % (&columns/3)) != 0
                let l:win.str_width += 1
            endif
        else
            let l:str_len = strlen(l:str) + 3
            let l:win.str_width = 1
        endif
        if empty(s:win_list)
            let l:win.line=3
        else
            let l:win.line=s:win_list[-1].line + 2 + s:win_list[-1].str_width
        endif
        let l:opts = {'relative': 'editor', 'width': l:str_len, 'height': l:win.str_width, 'col': &columns,
                    \ 'row': l:win.line, 'anchor': 'NW', 'border': 'single', 'style': 'minimal', 'zindex': 200}
        let l:win.id=nvim_open_win(l:bufnr, v:false,l:opts)
        call nvim_buf_set_lines(l:bufnr, 0, -1, v:false, [l:str])
        call nvim_win_set_option(l:win.id, 'winhl', 'Normal:'.l:level.',FloatBorder:vinux_border')
        call nvim_buf_set_option(l:bufnr, 'buftype', 'nofile')
        call nvim_buf_set_option(l:bufnr, 'bufhidden', 'wipe')
        call nvim_win_set_option(l:win.id, 'winblend', 30)
        call add(s:win_list, l:win)
        call timer_start(5000, function('<SID>nvim_close_win'), {'repeat': 1})
    elseif term#env#SupportFloatingWindows() == 1
        let l:str=' '.a:str
        let l:win={}
        if strlen(l:str) > (&columns/3)
            let l:str_len = &columns/3
            let l:win.str_width = strlen(l:str) / (&columns/3)
            if (strlen(l:str) % (&columns/3)) != 0
                let l:win.str_width += 1
            endif
        else
            let l:str_len = strlen(l:str)
            let l:win.str_width = 1
        endif
        if empty(s:win_list)
            let l:win.line=3
        else
            let l:win.line=s:win_list[-1].line + 2 +s:win_list[-1].str_width
        endif
        let l:win.id = popup_create(l:str, {
                    \ 'line': l:win.line,
                    \ 'col': &columns-l:str_len-3,
                    \ 'time': 5000,
                    \ 'tab': -1,
                    \ 'zindex': 200,
                    \ 'highlight': l:level,
                    \ 'maxwidth': &columns/3,
                    \ 'border': [],
                    \ 'borderchars':['─', '│', '─', '│', '┌', '┐', '┘', '└'],
                    \ 'borderhighlight':['vinux_border'],
                    \ 'drag': 1,
                    \ 'callback': 'VimCloseWin',
                    \ })
        call add(s:win_list, l:win)
    else
        redraw!
        execut 'echohl '.l:level | echom ' '.a:str | echohl None
    endif
endfunction

