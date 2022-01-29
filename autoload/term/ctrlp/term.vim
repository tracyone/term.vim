"ctrlp term
"author:tracyone@live.cn

function! s:get_term_list() abort
    let l:buf_list = term#terminal#get_buf_list()
    let l:result_list = []
    for l:buf in l:buf_list
        call add(l:result_list, l:buf.':'.term#terminal#get_title(l:buf))
    endfor
    return l:result_list
endfunction

call add(g:ctrlp_ext_vars, {
      \ 'init': 'term#ctrlp#term#init()',
      \ 'accept': 'term#ctrlp#term#accept',
      \ 'lname': 'term',
      \ 'sname': 'color',
      \ 'type': 'line',
      \ 'sort': 1,
      \ 'specinput': 0,
      \ })

let s:text = []
function! term#ctrlp#term#init() abort
  return s:text
endfunction

"press ctrl-v will not exit ctrlp
function! term#ctrlp#term#accept(mode, str) abort
    call ctrlp#exit()
  if a:mode ==# 'e'
      let l:HowToOpen=0x2
  elseif a:mode ==# 't'
      let l:HowToOpen=0x4
  elseif a:mode ==# 'v'
      let l:HowToOpen=0x2
  elseif a:mode ==# 'h'
      let l:HowToOpen=0x1
  else
      let l:HowToOpen=0x2
  endif
  let l:buf =  str2nr(matchstr(a:str, '\d\+\(:\)\@='))
  if len(s:key_text)
      for l:t in s:key_text
          call term#terminal#send_key(l:buf, l:t."\r")
      endfor
  endif
  call term#terminal#open_term({'opener':l:HowToOpen, 'bufnr':l:buf})
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

function! term#ctrlp#term#id() abort
  return s:id
endfunction

function! term#ctrlp#term#start(text) abort
    let s:key_text = a:text
    let s:text = s:get_term_list()
    call ctrlp#init(term#ctrlp#term#id()) 
endfunction
