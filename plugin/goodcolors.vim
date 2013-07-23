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
    if exists('*s:RandomColorScheme')
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
                    \ 'peaksea',
                    \ 'solarized'
                    \]


if !exists('g:random_color_schemes')
    let g:random_color_schemes = s:color_schemes
endif

let s:all_color_schemes = extend([], g:random_color_schemes)

function! s:GetOneOrZero()
    let str_time = localtime() . ''
    let time_len = strlen(str_time)
    let last_int = strpart(str_time, time_len - 1) + 0
    return last_int % 2
endfunction

let s:counter = 0
function! s:GetRandomScheme()
    let s:counter = s:counter + 1
    let now = localtime() + s:counter
    let remainder = now % len(s:all_color_schemes)
    "To avoid an error for an invalid index use the get() function.
    let scheme = get(s:all_color_schemes, remainder, 'NULL')
    "echo 'remainder: '  . remainder . ' ' . scheme
    if scheme == 'NULL'
        return get(s:all_color_schemes, 0)
    endif
    return scheme
endfunction

function! s:RandomColorScheme()
    "echo 'run random'
    let randColor = 0
    while !randColor
        let scheme = s:GetRandomScheme()
        let file_path = globpath(&runtimepath, 'colors/' . scheme . '.vim')
        "echo 'path: ' . file_path
        if filereadable(file_path)
            let randColor = 1
            execute 'colorscheme ' . scheme
        endif
    endwhile
endfunction


function!  s:EditColorScheme(scheme)
    let file_path = globpath(&runtimepath, 'colors/' . a:scheme . '.vim')
    if filereadable(file_path)
        execute ':split ' . file_path
    endif
endfunction

command! -nargs=0 RandomColor call s:RandomColorScheme()
command! -nargs=1 EditColor call s:EditColorScheme('<args>')
call s:RandomColorScheme()

let &cpo = s:save_cpo


