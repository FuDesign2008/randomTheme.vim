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
    if exists('*s:RandomColorScheme')

        if exists('g:random_color_start') && g:random_color_start
            call s:RandomColorScheme()
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

if exists('g:random_color_schemes')
    let s:allColorSchemes = g:random_color_schemes
else
    let filePaths = globpath(&runtimepath, "colors/*.vim")
    let filePathList = split(filePaths, '\n')
    for filePath in filePathList
        let colorSchemeName = fnamemodify(filePath, ':t:r')
        call add(s:allColorSchemes, colorSchemeName)
    endfor
endif

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

function! s:RandomColorScheme()

    if len(s:allColorSchemes) == 0
        return
    endif

    "echo 'run random'
    let randColor = 0
    while !randColor
        let scheme = s:ListRandomValue(s:allColorSchemes)
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

"------  create commands for solarized color
function! s:SolarizedColor(light)
    execute 'set background=' . (a:light ? 'light' : 'dark')
    execute 'colo solarized'
endfunction
command! -nargs=0 SolarizedLight call s:SolarizedColor(1)
command! -nargs=0 SolarizedDark  call s:SolarizedColor(0)


command! -nargs=0 RandomColor call s:RandomColorScheme()
"------

let s:randomOnStart = 1
if exists('g:random_color_start')
    let s:randomOnStart = g:random_color_start
endif

if s:randomOnStart != 0
    let guiRunning = has('gui_running')
    if s:randomOnStart == 2
        if guiRunning
            call s:RandomColorScheme()
        endif
    elseif s:randomOnStart == 3
        if !guiRunning
            call s:RandomColorScheme()
        endif
    else
        call s:RandomColorScheme()
    endif
endif

let &cpo = s:save_cpo


