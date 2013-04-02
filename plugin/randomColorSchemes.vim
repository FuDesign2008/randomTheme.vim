"randomColorSchemes.vim
"
"author: fudesign2008@163.com
"
" This plugin will set random color scheme when the vim starts up.
" Use `:RandomColor` command to random scheme manually
"
"
"

if &cp || exists('g:random_color_schemes_loaded')
    finish
endif

let g:random_color_schemes_loaded = 1
let s:save_cpo = &cpo
set cpo&vim

let s:color_schemes = ['pyte',
                    \ 'eclipse',
                    \ 'summerfruit',
                    \ 'autumnleaf_modified',
                    \ 'ironman',
                    \ 'nuvola',
                    \ 'oceanlight',
                    \ 'simpleandfriendly',
                    \ 'butterscream',
                    \ 'github',
                    \ 'proton',
                    \ 'mayansmoke',
                    \ 'grb256',
                    \ 'guardian',
                    \ 'codeschool',
                    \ 'distinguished',
                    \ 'jellybeans',
                    \ 'railscasts',
                    \ 'twilight',
                    \ 'vividchalk',
                    \ 'candy',
                    \ 'phd',
                    \ 'ir_black',
                    \ 'ir_blue',
                    \ 'ir_dark',
                    \ 'molokai']

let s:color_schemes_both = ['solarized']

if !exists('g:random_color_schemes')
    let g:random_color_schemes = s:color_schemes
endif
if !exists('g:random_color_schemes_both')
    let g:random_color_schemes_both = s:color_schemes_both
endif

if !exists('g:random_color_schemes_patch')
    let g:random_color_schemes_patch = 1
endif

let s:all_color_schemes = extend([], g:random_color_schemes)
let s:all_color_schemes = extend(s:all_color_schemes, g:random_color_schemes_both)

function! s:GetOneOrZero()
    let str_time = localtime() . ''
    let time_len = strlen(str_time)
    let last_int = strpart(str_time, time_len - 1) + 0
    return last_int % 2
endfunction

function! s:GetRandomScheme()
    let str_time = localtime() . ''
    let time_len = strlen(str_time)
    let colors_len = len(s:all_color_schemes)
    let last_int = strpart(str_time, time_len - colors_len) + 0

    let remainder = last_int % colors_len
    return s:all_color_schemes[remainder]
endfunction

function! s:RandomColorScheme()
    let scheme = s:GetRandomScheme()

    if strlen(scheme) == 0
        return
    endif
    "set background
    if index(g:random_color_schemes_both, scheme) >=0
        if s:GetOneOrZero() == 1
            execute 'set background=dark'
        else
            execute 'set background=light'
        endif

    endif
    "set colorscheme
    if g:random_color_schemes_patch
        let file_path = globpath(&runtimepath, 'colors/' . scheme . '_patch.vim')
        if filereadable(file_path)
            "echomsg 'execute colo ' . scheme .'_patch'
            execute 'colorscheme ' . scheme . '_patch'
            return
        endif
    endif

    let file_path = globpath(&runtimepath, 'colors/' . scheme . '.vim')
    if filereadable(file_path)
        "echomsg 'execute colo ' . scheme
        execute 'colorscheme ' . scheme
    endif

endfunction

call s:RandomColorScheme()

command! -nargs=0 RandomColor call s:RandomColorScheme()


let &cpo = s:save_cpo


