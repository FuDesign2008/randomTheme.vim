"randomColorSchemes.vim
"
"author: fudesign2008@163.com
"
" This plugin will set random color scheme when the vim starts up.
" Use `:RandomColor` command to random scheme manually
"
"
"

if &cp || exists("g:random_color_schemes")
    finish
endif
let g:random_color_schemes = 1
let s:save_cpo = &cpo
set cpo&vim

let s:defaultFavorites = ['fudesign', 'jelly', 'molo']

if !exists('g:favoriteColorSchemes')
    let g:favoriteColorSchemes = s:defaultFavorites
endif

function! s:GetRandomScheme()
    let str_time = localtime() . ''
    let time_len = strlen(str_time)
    let colors_len = len(g:favoriteColorSchemes)
    let last_int = strpart(str_time, time_len - colors_len) + 0

    let remainder = last_int % colors_len
    return g:favoriteColorSchemes[remainder]
endfunction

function! s:RandomColorScheme()
    let scheme = s:GetRandomScheme()
    if strlen(scheme)
        execute 'colorscheme ' . scheme
    endif
endfunction

call s:RandomColorScheme()

command! -nargs=0 RandomColor call s:RandomColorScheme()


let &cpo = s:save_cpo


