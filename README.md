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
    * [mayansmoke](https://github.com/vim-scripts/mayansmoke)

###Total

1. Light Schemes
    * [pyte](https://github.com/therubymug/vim-pyte)
    * [eclipse](https://github.com/vim-scripts/eclipse.vim)
    * [summerfruit](https://github.com/vim-scripts/summerfruit.vim)
    * [AutumnLeaf](https://github.com/vim-scripts/autumnleaf_modified.vim)
    * [ironman](https://github.com/vim-scripts/ironman.vim)
    * [nuvola](https://github.com/vim-scripts/nuvola.vim)
    * [oceanlight](https://github.com/vim-scripts/oceanlight)
    * [simpleandfriendly](https://github.com/vim-scripts/simpleandfriendly.vim)
    * [buttercream](https://github.com/FuDesign2008/buttercream.vim)
    * [github](https://github.com/FuDesign2008/github.vim)
    * [Proton](https://github.com/FuDesign2008/proton.vim)
    * [mayansmoke](https://github.com/vim-scripts/mayansmoke)
1. Dark Schemes
    * [RGB256](https://github.com/alindeman/grb256)
    * [Guardian](https://github.com/FuDesign2008/guardian.vim)
    * [Codeschool](https://github.com/FuDesign2008/codeschool.vim)
    * [Distinguished](https://github.com/Lokaltog/vim-distinguished)
    * [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
    * [Railscasts](https://github.com/jpo/vim-railscasts-theme)
    * [Twilight](https://github.com/matthewtodd/vim-twilight)
    * [Vividchalk](https://github.com/tpope/vim-vividchalk)
    * [Candy](https://github.com/vim-scripts/candy.vim)
    * [PhD] (https://github.com/FuDesign2008/phd.vim)
    * [ir_black](http://www.github.com/twerth/ir_black)
    * ir_blue
    * ir_dark
    * [molokai](http://www.github.com/tomasr/molokai)
1. Special Schemes
    * [solarized](https://github.com/altercation/vim-colors-solarized)


##Customing Color Schemes
Sometimes some color scheme does not fit eyes and some modifications should be made.

1. ir_fudesign, depending on [ir_black](http://www.github.com/twerth/ir_black)
1. jelly, depending on [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
1. molo, depending on [molokai](http://www.github.com/tomasr/molokai)

##Install Color Schemes With [Vundle](https://github.com/gmarik/vundle)

```vim
"light color schemes
Bundle 'therubymug/vim-pyte'
Bundle 'FuDesign2008/eclipse.vim'
Bundle 'vim-scripts/summerfruit.vim'
Bundle 'vim-scripts/autumnleaf_modified.vim'
Bundle 'FuDesign2008/ironman.vim'
Bundle 'vim-scripts/nuvola.vim'
Bundle 'vim-scripts/oceanlight'
Bundle 'FuDesign2008/simpleandfriendly.vim'
Bundle 'FuDesign2008/buttercream.vim'
Bundle 'FuDesign2008/github.vim'
Bundle 'FuDesign2008/proton.vim'
Bundle 'FuDesign2008/mayansmoke.vim'
"dark color schemes
Bundle 'alindeman/grb256'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'FuDesign2008/guardian.vim'
Bundle 'FuDesign2008/codeschool.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'nanotech/jellybeans.vim'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'matthewtodd/vim-twilight'
Bundle 'tpope/vim-vividchalk'
Bundle 'FuDesign2008/candy.vim'
Bundle 'FuDesign2008/phd.vim'
Bundle 'twerth/ir_black'
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
Bundle 'FuDesign2008/GoodColors.vim'
"color schemes end
```

##Random Favorite Color Schemes
Using one single favorite color scheme is good, but sometimes is toneless. More
than one favorite color schemes are tasteful. Randoming favorites is better.

By default, the `./plugin/randomColorSchemes.vim` will random color schemes in
`./colors` folder of `GoodColors.vim`.

If you want to add/remove [other] colors, yon can put codes like these into
`.vimrc`:

```vim
"config which color schemes to random
let g:random_color_schemes = ['pyte',
                    \ 'eclipse',
                    \ 'summerfruit',
                    \ 'autumnleaf_modified',
                    \ 'ironman',
                    \ 'nuvola',
                    \ 'simpleandfriendly',
                    \ 'butterscream',
                    \ 'github',
                    \ 'proton']


"config color schemes that have light and dark background
let g:random_color_schemes_both = ['solarized']

"config to use patch for color schemes or not, default is 1
let g:random_color_schemes_patch = 0
```

