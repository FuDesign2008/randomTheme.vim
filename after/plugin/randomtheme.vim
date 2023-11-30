"randomcolor.vim
"
"author: fudesign2008@163.com
"
" This plugin will set random color scheme when the vim starts up.
" Use `:RandomTheme` command to random scheme manually
"
"
"

if &compatible || exists('g:random_theme_loaded')
  finish
endif

let g:random_theme_loaded = 1
let s:save_cpo = &cpoptions
set cpoptions&vim


let s:scriptPath = expand('<sfile>:p:h')
let s:originalGuiCursor = &guicursor

"  s:allColorThemes {list}  <{name: 'string', light: 0|1}>
function s:ReadDBIfNeeded()
    if exists('s:allColorThemes')
        return
    endif
    let jsonFile = s:scriptPath . '/colorschemes.json'
    " echo "jsonFile: " . jsonFile
    if filereadable(jsonFile)
        let lines = readfile(jsonFile)
        let content = join(lines, '')
        let schemeList = json_decode(content)
        let s:allColorThemes = schemeList
    else
        let s:allColorThemes = []
        echo 'file not filereadable'
    endif

    let s:allColorSchemeNames = []
    for item in s:allColorThemes
      call add(s:allColorSchemeNames, item.name)
    endfor
endfunction



if exists('g:favorite_color_schemes')
    let s:favoriteColorSchemes = g:favorite_color_schemes
elseif exists('g:random_color_schemes')
    " compatible with old setting
    let s:favoriteColorSchemes = g:random_color_schemes
else
    let s:favoriteColorSchemes = []
endif


"==============================================================================
" RandomNumber is taken from
" https://github.com/dahu/vim-rng/blob/master/plugin/rng.vim
"==============================================================================
let s:m_w = 1 + getpid()
let s:m_z = localtime()

" not sure of the wisdom of generating a full 32-bit RN here
" and then using abs() on the sucker. Feedback welcome.
function! s:RandomNumber(...)
  if a:0 == 0
    let s:m_z = (36969 * and(s:m_z, 0xffff)) + (s:m_z / 65536)
    let s:m_w = (18000 * and(s:m_w, 0xffff)) + (s:m_w / 65536)
    return (s:m_z * 65536) + s:m_w      " 32-bit result
  elseif a:0 == 1 " We return a number in [0, a:1] or [a:1, 0]
    return a:1 < 0 ? s:RandomNumber(a:1,0) : s:RandomNumber(0,a:1)
  else " if a:2 >= 2
    return abs(s:RandomNumber()) % (abs(a:2 - a:1) + 1) + a:1
  endif
endfunction
" end RNG }}}
"============


"@param {Integer} max
"@return {Integer} return a integer between [0, max - 1]
function! s:RandomInt(max)
    let randomInt = 0

    if a:max > 0
        let randomInt = s:RandomNumber(a:max * 8) % a:max
    endif

    return randomInt
endfunction



function! s:UniqueList(list)
    let newList = []

    for item in a:list
        if index(newList, item) == -1
            call add(newList, item)
        endif
    endfor

    return newList
endfunction

"@param {List} theList
"@return {List}
function! s:RandomOrder(theList, isUnique)
    if a:isUnique
        let uniqueArr = a:theList
    else
        let uniqueArr = s:UniqueList(a:theList)
    endif

    let length = len(uniqueArr)
    let newList = []
    let counter = 0

    while counter < length
        let index = s:RandomInt(length)
        let item = get(uniqueArr, index)

        while index(newList, item) != -1
            let index = s:RandomInt(length)
            let item = get(uniqueArr, index)
        endwhile

        call add(newList, item)
        let counter = counter + 1
    endwhile

    return newList
endfunction


" @param schemesInRandom {Array}
" @param start {number}
" @param mode {string} 'light'/'dark'/''
" @return {object}
function! s:GetNextColorScheme(schemesInRandom, start, mode)
    " echo 's:GetNextColorScheme'
    " echo a:schemesInRandom
    if empty(a:schemesInRandom)
        return {'index': -1}
    endif

    let length = len(a:schemesInRandom)
    let foundName = ''
    let foundIndex = -1
    let loopCount = 0
    let theIndex = a:start

    while foundIndex == -1 && loopCount < length
        let loopCount += 1

        let index = (theIndex + length) % length
        let item = get(a:schemesInRandom, index, {})
        let name = get(item, 'name', '')
        let light = get(item, 'light', 0)
        let dark = get(item, 'dark', 0)

        if a:mode ==# 'light'
            if light
                let foundIndex = index
                let foundName = name
            endif
        elseif a:mode ==# 'dark'
            if dark
                let foundIndex = index
                let foundName = name
            endif
        else
            let foundIndex = index
            let foundName = name
        endif

        let theIndex = index + 1
    endwhile

    return {'name': foundName, 'index': foundIndex, 'mode': a:mode}
endfunction

function s:ResetGuiCursor()
  execute 'set guicursor=' . s:originalGuiCursor
endfunction

" @param {string} name
" @param {'light'|'dark'|''} mode
function! s:SetTheme(name, mode)
  let found = {}
  for item in s:allColorThemes
    if item.name ==# a:name
      let found = item
      break
    endif
  endfor

  if empty(found)
    return
  endif

  let foundIndex = get(found, 'index')
  let foundName = get(found, 'name', '')
  let airlineTheme=get(found, 'airline', '')
  let commandBeforeColo=get(found, 'commandBeforeColo', '')
  let override=get(found, 'override', '')

  if foundIndex == -1 || foundName ==# ''
      echomsg 'Failed to find a matched scheme'
  else
      " Some color scheme change guicursor option
      " so reset it bebore changing to other color schemes
      call s:ResetGuiCursor()
      if a:mode ==# 'light' || a:mode ==# 'dark'
        execute 'set background=' . a:mode
      endif

      if commandBeforeColo !=# ''
        execute '' . commandBeforeColo
      endif

      if override ==# ''
        execute 'colo ' . foundName
      else
        execute 'colo ' . override
      endif

      if airlineTheme !=# ''
        execute ':AirlineTheme '. airlineTheme
      endif
  endif
endfunction

let s:allColorThemesInRandom = []
let s:allColorThemeIndex = 0

" @param  {'light'|'dark'|''} mode
function! s:RandomAll(mode)
    call s:ReadDBIfNeeded()
    " echo s:allColorThemes

    if empty(s:allColorThemes)
      return
    endif

    if empty(s:allColorThemesInRandom)
        let s:allColorThemesInRandom = s:RandomOrder(s:allColorThemes, 1)
    endif

    let found = s:GetNextColorScheme(s:allColorThemesInRandom, s:allColorThemeIndex, a:mode)
    let foundIndex = get(found, 'index')
    let foundName = get(found, 'name', '')
    " echo 'RandomAll found'
    " echo found

    if foundIndex == -1 || foundName ==# ''
        echomsg 'Failed to find a matched scheme'
    else
        let s:allColorThemeIndex = foundIndex + 1
        call s:SetTheme(foundName, a:mode)
    endif
endfunction


" @params {string} name
" @return {object}
function! s:FindColorSchemesInAll(name)
    for item in s:allColorThemes
        let itemName = get(item, 'name', '')
        if a:name == itemName
            return item
        endif
    endfor
    return {}
endfunction


let s:favoriteColorThemes = []
let s:favoriteColorThemeNames = []
let s:hasSetupFavoriteColorThemes = 0
function! s:SetupFavoriteColorThemesIfNeeded()
    if s:hasSetupFavoriteColorThemes
        return
    endif
    call s:ReadDBIfNeeded()
    if empty(s:favoriteColorSchemes)
        return
    endif

    for name in s:favoriteColorSchemes
        let found = s:FindColorSchemesInAll(name)
        if !empty(found)
            call add(s:favoriteColorThemes, found)
            call add(s:favoriteColorThemeNames, name)
        endif
    endfor

    let s:hasSetupFavoriteColorThemes = 1
endfunction



let s:favoriteColorThemesInRandom = []
let s:favoriteColorThemeIndex = 0
" @param mode {string} 'light'/'dark'/''
function! s:RandomFavorite(mode)
    call s:SetupFavoriteColorThemesIfNeeded()
    if empty(s:favoriteColorThemes)
        return
    endif
    if empty(s:favoriteColorThemesInRandom)
        let s:favoriteColorThemesInRandom = s:RandomOrder(s:favoriteColorThemes, 0)
    endif
    " echo "RandomFavorite: " . a:mode
    " echo s:favoriteColorThemes

    let found = s:GetNextColorScheme(s:favoriteColorThemesInRandom, s:favoriteColorThemeIndex, a:mode)
    let foundIndex = get(found, 'index')
    let foundName = get(found, 'name', '')

    if foundIndex == -1 || foundName ==# ''
        echomsg 'Failed to find a matched scheme'
    else
        let s:favoriteColorThemeIndex = foundIndex + 1
        execute 'colo ' . foundName
    endif
endfunction



if exists('g:favorite_gui_fonts') == 0 || empty('g:favorite_gui_fonts')
    let g:favorite_gui_fonts = [
                \ 'Cascadia\ Code:h12',
                \ 'Consolas:h13',
                \ 'Fira\ Code:h12',
                \ 'Hack:h14',
                \ 'IBM\ Plex\ Mono:h14',
                \ 'Inconsolata:h13',
                \ 'Monaco:h12',
                \ 'Roboto\ Mono:h14',
                \ 'IntelOne\ Mono:h12',
                \ 'Source\ Code\ Pro:h12'
                \]
endif

" @param {string} font
" @return {Font}
" @return {Font.name} string
" @return {Font.size} number
function s:NormalizeGuiFont(font)
  " get gui font
  let value=trim(a:font)
  let theFont = {}
  if len(value) == 0
    "empty
    return theFont
  endif

  if stridx(value, ':h') != -1
    " font name:h10
    let arr = split(value, ':h')
    let theFont.name = arr[0]
    let theFont.size = str2nr(arr[1])
  elseif stridx(value, '\') != -1
    " font name\10
    let arr = split(value, '\')
    let theFont.name = arr[0]
    let theFont.size = str2nr(arr[1])
  endif

  return theFont
endfunction

let s:fontExtraSize = 0
" @param {string|number} extraSize
function s:RandomFontSize(...)
  let extraSize = 0

  if a:0 == 1
    let extraSizeStr = trim(a:1)
    let extraSize = str2nr(a:1)
  endif

  let s:fontExtraSize = extraSize
  let guifont = s:GetFontFromFavorite(0)
  call s:SetGuiFont(guifont)
endfunction

function s:RandomFontSizeReset()
  let s:fontExtraSize = 0
  let guifont = s:GetFontFromFavorite(0)
  call s:SetGuiFont(guifont)
endfunction


" @see https://forum.ubuntu.com.cn/viewtopic.php?t=45358
" @see :help setting-guifont
" @params {Font}
" @params {Font.name} string
" @params {Font.size} number
function! s:SetGuiFont(nomalizedFont)
    if has('gui_running')
        let normalized = a:nomalizedFont
        if  empty(normalized)
            return
        endif
        let name = normalized.name
        let size= normalized.size
        let size = size + s:fontExtraSize
        " for ubuntu vim-gonme
        if has('x11')
            " set guifont='font name\ 10'
            let commandStr = 'set guifont=' . name . '\ ' . size
            execute commandStr
        else
            " set guifont='font name:h10'
            let commandStr = 'set guifont=' . name . ':h' . size
            execute commandStr
        endif
    endif
endfunction



let s:fontSwitchIndex = s:RandomInt(len(g:favorite_gui_fonts))

" @param {0|1} goNext
" @param {Font}
function s:GetFontFromFavorite(goNext)
    if exists('g:favorite_gui_fonts') == 0 ||  empty('g:favorite_gui_fonts')
      return {}
    endif
    let length = len(g:favorite_gui_fonts)

    if a:goNext
      let s:fontSwitchIndex += 1
    endif

    let index = s:fontSwitchIndex % length
    let value = get(g:favorite_gui_fonts, index)
    let normalized = s:NormalizeGuiFont(value)
    return normalized
endfunction

function! s:SwitchFont()
  let guifont = s:GetFontFromFavorite(1)
  call s:SetGuiFont(guifont)
endfunction


function! s:RedrawAsyntaxHighlight()
  execute 'syntax on'
  "@see https://vim.fandom.com/wiki/Fix_syntax_highlighting
  execute 'syntax sync fromstart'
endfunction


" @return {0 | 1} day or not
function s:IsDayMode()
  let l:hour = strftime('%H')
  let l:mode = 0

  if l:hour > s:dayStart && l:hour < s:nightStart
    let l:day = 1
  else
    let l:day = 0
  endif

  return l:day
endfunction

function s:RandomTheme(...)
    let mode = ''

    if a:0 == 1
        let mode = trim(a:1)
    endif

    if mode ==# 'dark' || mode ==# 'light' || mode ==# ''
      call s:RandomAll(mode)
      call s:SwitchFont()
      call s:RedrawAsyntaxHighlight()
    elseif mode ==# 'auto'
      let l:theme_mode = s:IsDayMode() ? 'light' : 'dark'
      call s:RandomAll(l:theme_mode)
      call s:SwitchFont()
      call s:RedrawAsyntaxHighlight()
    else
      call s:ReadDBIfNeeded()
      if index(s:allColorSchemeNames, mode) > -1
        call s:SetTheme(mode, '')
        call s:SwitchFont()
        call s:RedrawAsyntaxHighlight()
      else
        echo 'Failed to find color scheme: ' . mode
      endif
    endif

endfunction

function s:RandomFavoriteTheme(...)
    let mode = ''
    if a:0 == 1
        let mode = trim(a:1)
    endif

    call s:SetupFavoriteColorThemesIfNeeded()
    if empty(s:favoriteColorSchemes)
        return
    endif

    if mode ==# 'dark' || mode ==# 'light' || mode ==# ''
      call s:RandomFavorite(mode)
      call s:SwitchFont()
      call s:RedrawAsyntaxHighlight()
    elseif mode ==# 'auto'
      let l:theme_mode = s:IsDayMode() ? 'light' : 'dark'
      call s:RandomFavorite(l:theme_mode)
      call s:SwitchFont()
      call s:RedrawAsyntaxHighlight()
    else
      if index(s:favoriteColorThemeNames, mode) > -1
        call s:SetTheme(mode, '')
        call s:SwitchFont()
        call s:RedrawAsyntaxHighlight()
      else
        echo 'Failed to find color scheme in favorite: ' . mode
      endif
    endif

endfunction

function! RandomThemeCompleter(A, L, P)
    let modes = extend(['dark', 'light'], s:allColorSchemeNames)
    let trimed = trim(a:A)
    let length = len(trimed)

    if length == 0
        return modes
    else
        let matchModes = []
        for item in modes
            if stridx(item, trimed) > -1 && len(item) > length
                call add(matchModes, item)
            endif
        endfor
        return matchModes
    endif
endfunction

function! RandomThemeFavoriteCompleter(A, L, P)
    let modes = extend(['dark', 'light'], s:favoriteColorThemeNames)
    let trimed = trim(a:A)
    let length = len(trimed)

    if length == 0
        return modes
    else
        let matchModes = []
        for item in modes
            if stridx(item, trimed) > -1 && len(item) > length
                call add(matchModes, item)
            endif
        endfor
        return matchModes
    endif
endfunction

command! -nargs=0 RandomFont call s:SwitchFont()
command! -nargs=1 RandomFontZoom call s:RandomFontSize(<f-args>)
command! -nargs=0 RandomFontZoomReset call s:RandomFontSizeReset()
command! -nargs=? -complete=customlist,RandomThemeCompleter RandomTheme call s:RandomTheme(<f-args>)
command! -nargs=? -complete=customlist,RandomThemeFavoriteCompleter RandomThemeFavorite call s:RandomFavoriteTheme(<f-args>)


let s:randomOnStart = 'all'
let s:dayStart = 8
let s:nightStart = 19


if exists('g:random_theme_start')
    let s:randomOnStart = g:random_theme_start
endif

if exists('g:random_theme_day_start')
    let s:dayStart = g:random_theme_day_start
endif

if exists('g:random_theme_night_start')
    let s:nightStart = g:random_theme_night_start
endif



if s:randomOnStart ==? 'all'
    execute ':RandomTheme'
elseif s:randomOnStart ==? 'all:light'
    execute ':RandomTheme light'
elseif s:randomOnStart ==? 'all:dark'
    execute ':RandomTheme dark'
elseif s:randomOnStart ==? 'all:auto'
    execute ':RandomTheme auto'
elseif s:randomOnStart ==? 'favorite'
    execute ':RandomThemeFavorite'
elseif s:randomOnStart ==? 'favorite:light'
    execute ':RandomThemeFavorite light'
elseif s:randomOnStart ==? 'favorite:dark'
    execute ':RandomThemeFavorite dark'
elseif s:randomOnStart ==? 'favorite:auto'
    execute ':RandomThemeFavorite auto'
endif

let &cpoptions = s:save_cpo


