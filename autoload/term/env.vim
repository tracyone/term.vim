"environment check
let s:is_unix     =  (has('mac') || has('osx')) + has('unix')
let s:is_win      = has('win32') + has('win64')
let s:is_nvim     = has('nvim')
let s:is_gui      = has('gui_running') + has('gui_macvim')
let s:has_python3 = has('python3')
let s:has_python  = has('python')
let s:python_ver  = s:has_python+s:has_python3
let s:ycm_dependency = has('patch-7.4.1578')
let s:is_tmux = empty($TMUX)
let s:has_display = empty($DISPLAY)
let s:support_cscope=has('cscope')+executable('cscope')

function! term#env#IsVim8() abort
    if v:version >= 800 && !s:is_nvim
        return 1
    else
        return 0
    endif
endfunction

function! term#env#IsMac() abort
    if s:is_unix == 2 | return 1 | endif
    return 0
endfunction

function! term#env#IsLinux() abort
    if s:is_unix == 1 | return 1 | endif
    return 0
endfunction

function! term#env#IsWindows() abort
    if s:is_win | return 1 | endif
    return 0
endfunction

function! term#env#IsWin64() abort
    if s:is_win == 2 | return 1 | endif
endfunction

function! term#env#IsWin32() abort
    if s:is_win == 1 | return 1 | endif
    return 0
endfunction

function! term#env#IsNvim() abort
    if s:is_nvim 
        let v = api_info().version
        return v.major + v.minor/10.0 + v.patch / 100.0
    endif
    return 0
endfunction

function! term#env#IsGui() abort
    if s:is_gui | return 1 | endif
    return 0
endfunction

function! term#env#IsMacVim() abort
    if s:is_gui == 2 | return 1 | endif
    return 0
endfunction

function! term#env#SupportPy2() abort
    if s:has_python | return 1 |endif
    return 0
endfunction

function! term#env#SupportPy3() abort
    if s:has_python3 | return 1 |endif
    return 0
endfunction

function! term#env#SupportPy() abort
    if s:python_ver | return 1 | endif
    return 0
endfunction

function! term#env#SupportYcm() abort
    if s:ycm_dependency && s:python_ver | return 1 | endif
    return 0
endfunction

function! term#env#IsTmux() abort
    if  s:is_tmux
        return 0
    endif
    return 1
endfunction

function! term#env#IsDisplay() abort
    if  s:has_display
        return s:is_win
    endif
    return 1
endfunction

function! term#env#IsUnix() abort
    if s:is_unix | return 1 | endif
    return 0
endfunction

function! term#env#SupportAsync() abort
    if s:is_nvim || v:version >= 800 | return 1 | endif
    return 0
endfunction


function! term#env#SupportCscope() abort
    if s:support_cscope == 2 | return 1 | endif
    return 0
endfunction

function! term#env#Executable(exe) abort
    return executable(a:exe)
endfunction

function! term#env#SupportTimer() abort
    return has('timers')
endfunction

function! term#env#SupportTerminal() abort
    return term#env#IsNvim() != 0 || (has('patch-8.0.1108') && has('terminal'))
endfunction

function! term#env#SupportFeature(feature_name) abort
    return has(a:feature_name)
endfunction

function! term#env#check_requirement() abort
    if v:version > 703
        return 1
    elseif v:version ==# 703
        return has('patch1058')
    else
        return 0
    endif
endfunction

function! term#env#get_termwinkey() abort
    if has('patch-8.0.1743')
        let l:result = &termwinkey
    else
        let l:result = &termkey
    endif
    if empty(l:result)
        return '<c-w>'
    endif
endfunction

function! term#env#SupportFloatingWindows() abort
    if term#env#IsNvim() == 0
        return exists('*popup_create')
    endif

    if !exists('*nvim_win_set_config')
        return 0
    endif

    return 2
endfunction
