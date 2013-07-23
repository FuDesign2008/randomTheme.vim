"goodcolors.vim
"
"author: fudesign2008@163.com
"
" This plugin will set random color scheme when the vim starts up.
" Use `:RandomColor` command to random scheme manually
"
"
"

if &cp || exists('g:good_colors_loaded')
    if exists('s:RandomColorScheme')
        call s:RandomColorScheme()
        finish
    endif
endif

let g:good_colors_loaded = 1
let s:save_cpo = &cpo
set cpo&vim

let s:color_schemes = ['pyte',
                    \ 'summerfruit',
                    \ 'autumnleaf_modified',
                    \ 'ironman',
                    \ 'proton',
                    \ 'mayansmoke',
                    \ 'codeschool',
                    \ 'distinguished',
                    \ 'jellybeans',
                    \ 'railscasts',
                    \ 'twilight',
                    \ 'vividchalk',
                    \ 'ir_black',
                    \ 'ir_blue',
                    \ 'ir_dark',
                    \ 'molokai',
                    \ 'zenburn',
                    \ 'desert',
                    \ 'gentooish',
                    \ 'wombat',
                    \ 'wombat256',
                    \ 'lucius',
                    \ 'peaksea'
                    \]

let s:color_schemes_gui_only = ['solarized']

if !exists('g:random_color_schemes')
    let g:random_color_schemes = s:color_schemes
endif

if !exists('g:color_schemes_gui_only')
    let g:color_schemes_gui_only = s:color_schemes_gui_only
endif


let s:all_color_schemes = extend([], g:random_color_schemes)
let s:all_color_schemes = extend(s:all_color_schemes, s:color_schemes_gui_only)

function! s:GetOneOrZero()
    let str_time = localtime() . ''
    let time_len = strlen(str_time)
    let last_int = strpart(str_time, time_len - 1) + 0
    return last_int % 2
endfunction

function! s:GetRandomScheme()
    let now = localtime()
    let remainder = now % len(s:all_color_schemes)
    "To avoid an error for an invalid index use the get() function.
    let scheme = get(s:all_color_schemes, remainder, 0)
    return scheme == 0 ? get(s:all_color_schemes, 0) : scheme
endfunction

function! s:RandomColorScheme()
    let randColor = 0
    while !randColor
        let scheme = s:GetRandomScheme()
        if !has('gui_running')
            while index(g:color_schemes_gui_only, scheme) != -1
                let scheme = s:GetRandomScheme()
            endwhile
        endif
        let file_path = globpath(&runtimepath, 'colors/' . scheme . '.vim')
        if filereadable(file_path)
            let randColor = 1
            execute 'colorscheme ' . scheme
        endif
    endwhile
endfunction


function!  s:EditColorScheme(scheme)
    let file_path = globpath(&runtimepath, 'colors/' . a:scheme . '.vim')
    echo file_path
    if filereadable(file_path)
        execute ':split ' . file_path
    endif
endfunction

command! -nargs=0 RandomColor call s:RandomColorScheme()
command! -nargs=1 EditColor call s:EditColorScheme('<args>')
call s:RandomColorScheme()

let &cpo = s:save_cpo


