"randomcolor.vim
"
"author: fudesign2008@163.com
"
" This plugin will set random color scheme when the vim starts up.
" Use `:RandomColor` command to random scheme manually
"
"
"

if &cp || exists('g:random_color_loaded')
    if exists('*s:RandomColor')

        if exists('g:random_color_start') && g:random_color_start
            call s:RandomColor()
        endif

        finish
    endif
endif

let g:random_color_loaded = 1
let s:save_cpo = &cpo
set cpo&vim

" commands for special color schemes
let s:specialSchemeCommands = {
            \ 'lucius': [ 'LuciusBlack',
                    \ 'LuciusBlackHighContrast',
                    \ 'LuciusBlackLowContrast',
                    \ 'LuciusDark',
                    \ 'LuciusDarkHighContrast',
                    \ 'LuciusDarkLowContrast',
                    \ 'LuciusLight',
                    \ 'LuciusLightHighContrast',
                    \ 'LuciusLightLowContrast',
                    \ 'LuciusWhite',
                    \ 'LuciusWhiteHighContrast',
                    \ 'LuciusWhiteLowContrast'
                \],
            \ 'solarized': ['SolarizedDark', 'SolarizedLight']
        \}

let s:schemeForCommandPrefix = {
            \ 'Lucius': 'lucius',
            \ 'Solarized': 'solarized'
        \}


let s:allColorSchemes = []
let s:favoriteColorSchemes = []

if exists('g:favorite_color_schemes')
    let s:favoriteColorSchemes = g:favorite_color_schemes
elseif exists('g:random_color_schemes')
    " compatible with old setting
    let s:favoriteColorSchemes = g:random_color_schemes
endif



let filePaths = globpath(&runtimepath, "colors/*.vim")
let filePathList = split(filePaths, '\n')
for filePath in filePathList
    let colorSchemeName = fnamemodify(filePath, ':t:r')
    call add(s:allColorSchemes, colorSchemeName)
endfor

for [key, value] in items(s:specialSchemeCommands)
    let nameIndex = index(s:allColorSchemes, key)
    if nameIndex > -1
        call remove(s:allColorSchemes, key)
        call extend(s:allColorSchemes, value)
    endif
endfor


let s:counter = 0
function! s:ListRandomValue(list)
    let s:counter = s:counter + 1
    let now = localtime() + s:counter
    let remainder = now % len(a:list)
    let value = get(a:list, remainder, '')
    if value == ''
        let value = get(a:list, 0, '')
    endif
    return value
endfunction

function! s:RandomColorSchemes(colorSchemes)

    if empty(a:colorSchemes)
        return
    endif

    "echo 'run random'
    let randColor = 0
    while !randColor
        let scheme = s:ListRandomValue(a:colorSchemes)
        let cmd = ''

        for [commandPrefix, schemeName] in items(s:schemeForCommandPrefix)
            if stridx(scheme, commandPrefix) > -1
                let cmd = scheme
                let scheme = schemeName
            endif
        endfor

        let filePath = globpath(&runtimepath, 'colors/' . scheme . '.vim')
        if strlen(filePath) > 3
            if cmd != '' && exists(':' . cmd)
                execute ':' . cmd
            else
                execute 'colorscheme ' . scheme
            endif
            let randColor = 1
        endif
    endwhile

endfunction


function! s:RandomAll()
    call s:RandomColorSchemes(s:allColorSchemes)
endfunction


function! s:RandomFavorite()
    call s:RandomColorSchemes(s:favoriteColorSchemes)
endfunction


function! s:RandomColor()
    if empty(s:favoriteColorSchemes)
        call s:RandomAll()
    else
        call s:RandomFavorite()
    endif
endfunction

"------  create commands for solarized color
function! s:SolarizedColor(light)
    execute 'set background=' . (a:light ? 'light' : 'dark')
    execute 'colo solarized'
endfunction
command! -nargs=0 SolarizedLight call s:SolarizedColor(1)
command! -nargs=0 SolarizedDark  call s:SolarizedColor(0)


command! -nargs=0 RandomColor call s:RandomColor()
command! -nargs=0 RandomAll   call s:RandomAll()
command! -nargs=0 RandomFavorite   call s:RandomFavorite()
"------

let s:randomOnStart = 1
if exists('g:random_color_start')
    let s:randomOnStart = g:random_color_start
endif

if s:randomOnStart != 0
    let guiRunning = has('gui_running')
    if s:randomOnStart == 2
        if guiRunning
            call s:RandomColor()
        endif
    elseif s:randomOnStart == 3
        if !guiRunning
            call s:RandomColor()
        endif
    else
        call s:RandomColor()
    endif
endif

let &cpo = s:save_cpo


