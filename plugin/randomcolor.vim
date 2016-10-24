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
    if exists(':RandomColor')

        if exists('g:random_color_start') && g:random_color_start
            execute ':silent RandomColor'
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
            \ 'solarized': [
                    \ 'SolarizedDark',
                    \ 'SolarizedLight'
                \]
        \}

let s:schemeForCommandPrefix = {
            \ 'Lucius': 'lucius',
            \ 'Solarized': 'solarized'
        \}


"@param {List} schemes
"@return {List}
function! s:convertColorSchemes(schemes)
    let colorSchemes = []

    for name in a:schemes
        if has_key(s:specialSchemeCommands, name)
            let commands = get(s:specialSchemeCommands, name)
            for command in commands
                call add(colorSchemes, {'color': name, 'command':command, 'matched': 0})
            endfor
        else
            call add(colorSchemes, {'color': name, 'matched': 0})
        endif
    endfor

    "echo colorSchemes

    return colorSchemes
endfunction

let filePaths = globpath(&runtimepath, 'colors/*.vim')
let filePathList = split(filePaths, '\n')

let temp = []
for filePath in filePathList
    let colorSchemeName = fnamemodify(filePath, ':t:r')
    call add(temp, colorSchemeName)
endfor

let s:allColorSchemes = s:convertColorSchemes(temp)

if exists('g:favorite_color_schemes')
    let s:favoriteColorSchemes = s:convertColorSchemes(g:favorite_color_schemes)
elseif exists('g:random_color_schemes')
    " compatible with old setting
    let s:favoriteColorSchemes = s:convertColorSchemes(g:random_color_schemes)
else
    let s:favoriteColorSchemes = []
endif


"@param {Integer} max
"@return {Integer} return a integer between [0, max - 1]
function! s:RandomInt(max)
    if a:max <= 1
        return 0
    endif

    let now = localtime()
    let remainder = now % a:max
    return remainder
endfunction

"@param {List} colorSchemes
function! s:CountHasMatched(colorSchemes)
    let counter = 0
    for scheme in a:colorSchemes
        if get(scheme, 'matched')
            let counter += 1
        endif
    endfor
    return counter
endfunction

function! s:getColorSchemeItem(colorSchemes, counter)
    let counter = -1

    for scheme in a:colorSchemes
        if get(scheme, 'matched') == 0
            let counter += 1
        endif
        if counter == a:counter
            return scheme
        endif
    endfor
endfunction

function! s:resetColorSchemes(colorSchemes)
    for scheme in a:colorSchemes
        let scheme['matched'] = 0
    endfor
endfunction

function! s:setColorScheme(color)
    let success = 1

    try
        execute 'colo ' . a:color
    catch /.*/
        let success = 0
    endtry

    return success
endfunction

"@param {List} colorSchemes
function! s:RandomColorSchemes(colorSchemes)

    if empty(a:colorSchemes)
        return
    endif

    "echo a:colorSchemes

    let isDone = 0
    while !isDone
        let matchedCounter = s:CountHasMatched(a:colorSchemes)
        let length = len(a:colorSchemes)
        let notMatchedCounter = length  - matchedCounter

        if (notMatchedCounter == 0)
            call s:resetColorSchemes(a:colorSchemes)
            let notMatchedCounter = length
        endif

        let currentIndex = s:RandomInt(notMatchedCounter)
        let schemeItem = s:getColorSchemeItem(a:colorSchemes, currentIndex)

        let schemeItem['matched'] = 1
        let color = get(schemeItem, 'color')
        let command = get(schemeItem, 'command')

        if command
            let cmd = ':' . command
            if !exists(cmd)
                call s:setColorScheme(color)
            endif
            if exists(cmd)
                execute cmd
                let isDone = 1
            else
                echo 'Failed to execute command `' . cmd . '`'
            endif
        else
            let isDone = s:setColorScheme(color)
            if !isDone
                echo 'Failed to set color: ' . color
            endif
        endif
    endwhile

    if isDone
        execute ':colo'
    endif

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
            execute ':silent RandomColor'
        endif
    elseif s:randomOnStart == 3
        if !guiRunning
            execute ':silent RandomColor'
        endif
    else
        execute ':silent RandomColor'
    endif
endif

let &cpo = s:save_cpo


