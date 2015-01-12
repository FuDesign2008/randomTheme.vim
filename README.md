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
* [peaksea](https://github.com/vim-scripts/peaksea)

###[Top Color Schemes](http://www.vim.org/scripts/script_search_results.php?keywords=&script_type=color+scheme&order_by=rating&direction=descending&search=search)
* [zenburn](https://github.com/jnurmine/Zenburn)
* [desert](https://github.com/vim-scripts/desert.vim)
* [gentooish](https://github.com/briancarper/gentooish.vim)
* [lucius](https://github.com/jonathanfilip/vim-lucius)

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
    * [Proton](https://github.com/FuDesign2008/proton.vim)
    * [mayansmoke](https://github.com/vim-scripts/mayansmoke)
1. Dark Schemes
    * [RGB256](https://github.com/alindeman/grb256)
    * [Codeschool](https://github.com/FuDesign2008/codeschool.vim)
    * [Distinguished](https://github.com/Lokaltog/vim-distinguished)
    * [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
    * [Railscasts](https://github.com/jpo/vim-railscasts-theme)
    * [Twilight](https://github.com/matthewtodd/vim-twilight)
    * [Vividchalk](https://github.com/tpope/vim-vividchalk)
    * [Candy](https://github.com/vim-scripts/candy.vim)
    * [ir_black](http://www.github.com/twerth/ir_black)
    * ir_blue
    * ir_dark
    * [molokai](http://www.github.com/tomasr/molokai)
    * [zenburn](https://github.com/jnurmine/Zenburn)
    * [desert](https://github.com/vim-scripts/desert.vim)
    * [gentooish](https://github.com/briancarper/gentooish.vim)
    * [wombat](https://github.com/cschlueter/vim-wombat)
    * wombat256
    * [lucius](https://github.com/jonathanfilip/vim-lucius)
    * [peaksea](https://github.com/vim-scripts/peaksea)
1. Special Schemes
    * [solarized](https://github.com/altercation/vim-colors-solarized)

##Color Schemes Testing

scheme              |gui  |terminal |total
--------------------|-----|---------|------
pyte                |++   |0        |++
eclipse             |0    |0        |0
summerfruit         |++   |0        |++
autumnleaf_modified |+    |+        |++
ironman             |+    |0        |+
nuvola              |+    |--       |-
oceanlight          |+    |0        |+
simpleandfriendly   |-    |-        |--
butterscream        |0    |0        |0
github              |+    |0        |+
proton              |++   |0        |++
mayansmoke          |+    |+        |++
grb256              |+    |0        |+
guardian            |0    |-        |-
codeschool          |++   |+        |+++
distinguished       |+    |+        |++
jellybeans          |++   |++       |++++
railscasts          |++   |+        |+++
twilight            |+    |+        |++
vividchalk          |+    |+        |++
candy               |0    |0        |0
phd                 |+    |0        |+
ir_black            |+    |+        |++
ir_blue             |+    |+        |++
ir_dark             |++   |+        |++
molokai             |++   |++       |++++
zenburn             |++   |++       |+++
desert              |++   |0        |++
gentooish           |++   |+        |+++
wombat              |+    |+        |++
wombat256           |+    |++       |+++
lucius              |++   |++       |++++
peaksea             |++   |++       |++++
solarized           |++   |-        |+

The schemes that total score is less than `++` will be abandoned, except solarized for gui.

##Customing Color Schemes
Sometimes some color scheme does not fit eyes and some modifications should be made.

1. ir_fudesign, depending on [ir_black](http://www.github.com/twerth/ir_black)
1. jelly, depending on [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
1. molo, depending on [molokai](http://www.github.com/tomasr/molokai)

##Install Color Schemes With [Vundle](https://github.com/gmarik/vundle)

```vim
"light color schemes
Bundle 'therubymug/vim-pyte'
Bundle 'vim-scripts/summerfruit.vim'
Bundle 'vim-scripts/autumnleaf_modified.vim'
Bundle 'FuDesign2008/ironman.vim'
Bundle 'FuDesign2008/proton.vim'
Bundle 'vim-scripts/mayansmoke'
"dark color schemes
Bundle 'FuDesign2008/codeschool.vim'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'nanotech/jellybeans.vim'
Bundle 'jpo/vim-railscasts-theme'
Bundle 'matthewtodd/vim-twilight'
Bundle 'tpope/vim-vividchalk'
Bundle 'twerth/ir_black'
Bundle 'tomasr/molokai'
Bundle 'jnurmine/Zenburn'
Bundle 'vim-scripts/desert.vim'
Bundle 'briancarper/gentooish.vim'
Bundle 'cschlueter/vim-wombat'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'vim-scripts/peaksea'
Bundle 'altercation/vim-colors-solarized'
Bundle 'FuDesign2008/GoodColors.vim'
"color schemes end
```

##Random Favorite Color Schemes
Using one single favorite color scheme is good, but sometimes is toneless. More
than one favorite color schemes are tasteful. Randoming favorites is better.

By default, the `./plugin/goodcolors.vim` will random the color schemes that
have scores more that `++`.

If you want to add/remove [other] colors, yon can put codes like these into
`.vimrc`:

```vim
"config which color schemes to random
let g:random_color_schemes = ['molokai',
                    \ 'zenburn',
                    \ 'jellybeans',
                    \ 'peaksea']

```


##Configuration

* `g:random_color_start`  Using a random color scheme when vim starting up or
not. Default value is `1`, you can set it to `0` in `.vimrc`.

* `g:random_color_schemes`  A list of color schemes that you want to use, see
`Random Favorite Color Schemes` for more infomation.

##Change Log


* 1.0.2
    - add `g:random_color_start` option

* 1.0.1
    - add help document

* 1.0.0
    - random good colors
    - add good colors


