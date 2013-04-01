"randomColorSchemes.vim
"
"author: fudesign2008@163.com
"
" This plugin will set random color scheme when the vim starts up.
" Use `:RandomColor` command to random scheme manually
"
"
"

if &cp || exists("g:random_color_schemes_loaded")
    finish
endif
let g:random_color_schemes_loaded = 1
let s:save_cpo = &cpo
set cpo&vim

let s:light_schemes = ['pyte',
                    \ 'eclipse',
                    \ 'summerfruit',
                    \ 'autumnleaf_modified',
                    \ 'ironman',
                    \ 'nuvola',
                    \ 'simpleandfriendly',
                    \ 'butterscream',
                    \ 'github',
                    \ 'proton',
                    \ 'solarized' ]
let s:dark_schemes = [ 'grb256',
                    \ 'distinguished',
                    \ 'guardian',
                    \ 'codeschool',
                    \ 'jellybeans',
                    \ 'railscasts',
                    \ 'twilight',
                    \ 'vividchalk',
                    \ 'candy',
                    \ 'phd',
                    \ 'ir_black',
                    \ 'ir_blue',
                    \ 'ir_dark',
                    \ 'molokai',
                    \ 'solarized' ]

if !exists('g:random_dark_schemes')
    let g:random_dark_schemes = s:dark_schemes
endif
if !exists('g:random_light_schemes')
    let g:random_light_schemes = s:light_schemes
endif

function! s:GetRandomScheme()
    if has('gui_runing')
        let colors = extend([], g:random_light_schemes, g:random_dark_schemes)
    else
        let colors = s:random_dark_schemes
    endif
    let str_time = localtime() . ''
    let time_len = strlen(str_time)
    let colors_len = len(colors)
    let last_int = strpart(str_time, time_len - colors_len) + 0

    let remainder = last_int % colors_len
    return colors[remainder]
endfunction

function! s:RandomColorScheme()
    let scheme = s:GetRandomScheme()
    if strlen(scheme)
        execute 'colorscheme ' . scheme

        if has(gui_runing)
            if scheme == 'solarized'
                execute 'background light'
            endif
        else
            execute 'background dark'
        endif
    endif
endfunction

call s:RandomColorScheme()

command! -nargs=0 RandomColor call s:RandomColorScheme()


let &cpo = s:save_cpo


