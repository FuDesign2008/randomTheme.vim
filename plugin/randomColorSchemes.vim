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

let s:light_schemes = ['pyte',
                    \ 'eclipse',
                    \ 'summerfruit',
                    \ 'autumnleaf_modified',
                    \ 'ironman',
                    \ 'nuvola',
                    \ 'simpleandfriendly',
                    \ 'butterscream',
                    \ 'github',
                    \ 'proton']

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
                    \ 'molokai']

let s:both_schemes = ['solarized']

if !exists('g:random_color_schemes_light')
    let g:random_color_schemes_light = s:light_schemes
endif
if !exists('g:random_color_schemes_dark')
    let g:random_color_schemes_dark = s:dark_schemes
endif
if !exists('g:random_color_schemes_both')
    let g:random_color_schemes_both = s:both_schemes
endif

if !exists('g:random_color_schemes_patch')
    let g:random_color_schemes_patch = 1
endif

let s:terminal_color_schemes = extend([], g:random_color_schemes_dark)
let s:terminal_color_schemes = extend(s:terminal_color_schemes, g:random_color_schemes_both)

let s:gui_color_schemes = extend([], s:terminal_color_schemes)
let s:gui_color_schemes = extend(s:gui_color_schemes, g:random_color_schemes_light)

function! s:GetRandomScheme()
    if has('gui_runing')
        let colors = s:gui_color_schemes
    else
        let colors = s:terminal_color_schemes
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

    if strlen(scheme) == 0
        return
    endif
    "set background
    if has('gui_runing')
        if index(g:random_color_schemes_light, scheme) >= 0
            execute 'set background=light'
        elseif index(g:random_color_schemes_dark, scheme) >= 0
            execute 'set background=dark'
        endif
    else
        execute 'set background=dark'
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


