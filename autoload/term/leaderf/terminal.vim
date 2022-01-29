function! s:open_shell(timer)
    let l:buf = str2nr(s:buf)
    call term#terminal#open_term({'bufnr':l:buf})
endfunction

function! term#leaderf#terminal#setting() abort
    if exists("g:Lf_Extensions") && has_key(g:Lf_Extensions, 'term')
        return
    endif
    if exists(':Leaderf')
        if !exists("g:Lf_Extensions")
            let g:Lf_Extensions = {}
        endif
        let g:Lf_Extensions.term = {
                    \       'source': "term#leaderf#terminal#source",
                    \       'accept': 'term#leaderf#terminal#accept',
                    \       'preview': 'term#leaderf#terminal#preview',
                    \       'supports_name_only': 1,
                    \       'supports_multi': 0,
                    \}
        if !exists("g:Lf_PreviewResult")
            let g:Lf_PreviewResult = {}
        endif
        let g:Lf_PreviewCode = 1
        let g:Lf_WindowPosition ='popup'
        let g:Lf_PreviewInPopup = 1
        let g:Lf_PreviewResult.term = 1
    endif
endfunction

function! term#leaderf#terminal#accept(line, args) abort
    let s:buf =  matchstr(a:line, '\d\+\(:\)\@=')
    call timer_start(100, function('<SID>open_shell'), {'repeat': 1})
endfunction

function! term#leaderf#terminal#preview(orig_buf_nr, orig_cursor, line, args) abort
    let l:buf_nr =  str2nr(matchstr(a:line, '\d\+\(:\)\@='))
    let l:linenum = term#terminal#get_line(l:buf_nr)
    if l:linenum > 20
        let l:linenum -= 20
    else
        let l:linenum = 0
    endif
    return [l:buf_nr, l:linenum, '']
endfunction

function! term#leaderf#terminal#source(args) abort
    let l:buf_list = term#terminal#get_buf_list()
    let l:result_list = []
    for l:buf in l:buf_list
        call add(l:result_list, l:buf.':'.term#terminal#get_title(l:buf))
    endfor
    return l:result_list
endfunction
