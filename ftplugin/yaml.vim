
function! s:kwalify_set_snip(cmd) "{{{
    lcd `=expand('%:p:h')`
    let l:cmd = ['kwalify-check', '--snip', expand('%')] + a:cmd
    if get(g:, 'kwalify_check_debug', 0)
        echomsg "COMMAND: " . join(l:cmd, ' ')
    endif
    let l:ret = system(join(l:cmd, ' '))
    if get(g:, 'kwalify_check_debug', 0)
        echomsg "RETVAL:"
        echomsg l:ret
    endif
    lcd -
    let l:lines = split(l:ret, '\r\n\|[\r\n]')
    if empty(l:lines)
        if get(g:, 'kwalify_check_debug', 0)
            echomsg "EMPTY RETVAL"
        endif
        return
    else
        if get(g:, 'kwalify_check_debug', 0)
            echomsg "SET FILE"
            echo msg l:lines[0]
        endif
        :NeoSnippetSource l:lines[0]
        return
    endif
endfunction "}}}

" vim: foldmethod=marker
