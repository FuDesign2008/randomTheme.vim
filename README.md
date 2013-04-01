GoodColors.vim
==============

Good color schemes for vim


##Good Color Schemes


###[10 Vim Color Schemes You Need to Own](http://www.vimninjas.com/2012/08/26/10-vim-color-schemes-you-need-to-own/)

* GRB256
* Guardian
* Codeschool
* Distinguished
* GitHub
* Jellybeans
* Railscasts
* Twilight
* Vividchalk
* Candy
* Solarized

###[10 Light Vim Color Schemes That You Should Consider Using](http://www.vimninjas.com/2012/09/14/10-light-colors/)

* pyte
* eclipse
* summerfruit
* AutumnLeaf
* ironman
* nuvola
* oceanlight
* simpleandfriendly
* buttercream
* solarized

###Henning's [VIM themes](http://leetless.de/vim.html)

* Pyte
* Proton
* Twilight
* PhD

###[ir_black Serials](http://www.github.com/twerth/ir_black)
    * ir_black
    * ir_blue
    * ir_dark
###Others
    * [molokai](http://www.github.com/tomasr/molokai)

###Total

1. Dark Schemes
    * [RGB256](https://github.com/alindeman/grb256)
    * Guardian -> no repo
    * Codeschool -> no repo
    * [Distinguished](https://github.com/Lokaltog/vim-distinguished)
    * [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
    * [Railscasts](https://github.com/jpo/vim-railscasts-theme)
    * [Twilight](https://github.com/matthewtodd/vim-twilight)
    * [Vividchalk](https://github.com/tpope/vim-vividchalk)
    * [Candy](https://github.com/vim-scripts/candy.vim)
    * PhD  -> no repo
    * [ir_black](http://www.github.com/twerth/ir_black)
    * ir_blue
    * ir_dark
    * [molokai](http://www.github.com/tomasr/molokai)
1. Light Schemes
    * [pyte](https://github.com/therubymug/vim-pyte)
    * [eclipse](https://github.com/vim-scripts/eclipse.vim)
    * [summerfruit](https://github.com/vim-scripts/summerfruit.vim)
    * [AutumnLeaf](https://github.com/vim-scripts/autumnleaf_modified.vim)
    * [ironman](https://github.com/vim-scripts/ironman.vim)
    * [nuvola](https://github.com/vim-scripts/nuvola.vim)
    * oceanlight -> no repo
    * [simpleandfriendly](https://github.com/vim-scripts/simpleandfriendly.vim)
    * buttercream -> no repo
    * github -> no repo
    * Proton -> no repo

1. Special Schemes
    * [solarized](https://github.com/altercation/vim-colors-solarized)


##Customing Color Schemes
Sometimes some color scheme does not fit eyes and some modifications should be made.

1. ir_fudesign, depending on [ir_black](http://www.github.com/twerth/ir_black)
1. jelly, depending on [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
1. molo, depending on [molokai](http://www.github.com/tomasr/molokai)

##Install Color Schemes With [Vundle](https://github.com/gmarik/vundle)

```vim
Bundle 'alindeman/grb256'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'nanotech/jellybeans.vim'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'matthewtodd/vim-twilight'
Bundle 'tpope/vim-vividchalk'
Bundle 'vim-scripts/candy.vim'
Bundle 'twerth/ir_black'
Bundle 'tomasr/molokai'
Bundle 'therubymug/vim-pyte'
Bundle 'vim-scripts/eclipse.vim'
Bundle 'vim-scripts/summerfruit.vim'
Bundle 'vim-scripts/autumnleaf_modified.vim'
Bundle 'vim-scripts/ironman.vim'
Bundle 'vim-scripts/nuvola.vim'
Bundle 'vim-scripts/simpleandfriendly.vim'
```

##Random Favorite Color Schemes
Using one single favorite color scheme is good, but sometimes is toneless. More than
one favorite color schemes are tasteful. Randoming favorites is better.
By default, the `./plugin/randomColorSchemes.vim` will random color schemes in
`./colors` folder of `GoodColors.vim`.

If you want to addd other colors, yon can put these codes into `.vimrc`:

```vim
let g:random_color_schemes = [ 'grb256',
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
    \ 'pyte',
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
```

