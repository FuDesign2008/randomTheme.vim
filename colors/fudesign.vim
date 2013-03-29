"Vim colorscheme fudesign
"based on ir_black.vim
"author: fudesign2008@163.com

" Based on
runtime colors/ir_black.vim

let g:colors_name = "fudesign"


"red #FF1010
"
"terminal
"red #FF1010
"blue #B5DCFE


hi LineNr           guifg=#7C7C7C     guibg=black       gui=NONE      ctermfg=darkgray    ctermbg=NONE        cterm=NONE
hi StatusLine       guifg=#CCCCCC     guibg=#333333     gui=italic    ctermfg=white       ctermbg=darkgray    cterm=NONE
hi StatusLineNC     guifg=#666666       guibg=#202020     gui=NONE      ctermfg=blue        ctermbg=darkgray    cterm=NONE  
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=REVERSE
hi SpecialKey       guifg=#808080     guibg=#000000     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=NONE
hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=white       ctermbg=red         cterm=NONE     guisp=#FF1010 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF1010     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF1010     gui=BOLD      ctermfg=white       ctermbg=red         cterm=NONE
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE	      cterm=underline

if version >= 700 " Vim 7.x specific colors
  hi CursorLine     guifg=NONE        guibg=#303030     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi CursorColumn   guifg=NONE        guibg=#303030     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi colorcolumn    guifg=NONE        guibg=#303030     gui=NONE      ctermfg=NONE        ctermbg=NONE        cterm=BOLD
  hi Search         guifg=NONE        guibg=#FF3030     gui=NONE      ctermfg=NONE        ctermbg=NONE      cterm=NONE
endif



