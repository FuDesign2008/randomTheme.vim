randomColor.vim
==============
A  plugin for random color schemes, even on start up!

## Install

1. Install this plugin.
1. Open vim and execute `:RandomColor` to enjoy!

## Usage

* `:RandomColor` - to set a random color scheme for vim

## Options

### `g:favorite_color_schemes`

By default, the plugin will try to find all the color schemes in runtime path.
If want to use your favorite color schemes for random, you can set a list/array
to this option in `.vimrc`. For example:

```vim
let g:favorite_color_schemes = ['molokai',
                    \ 'zenburn',
                    \ 'jellybeans',
                    \ 'peaksea']
```

### `g:random_color_start`

The plugin will use a random color scheme when vim starting up by default.
If you want to disable this action, you can set the value of
`g:random_color_start` in `.vimrc`. For example:

```vim

let g:random_color_start = 0
colo pyte

```

Available values are here:

* `0` - Do not use
* `1` - Use, *default value*
* `2` - Use, but only when vim is running in the GUI
* `3` - Use, but only when vim is NOT runing in the GUI



## Change Log

* 2015-11-03
    - Rename `g:random_color_schemes` to `g:favorite_color_schemes`
    - add `:RandomFavorite`, `:RandomAll` commands

* 2015-02-07
    - Rename to `randomColor.vim`

* 1.0.2
    - add `g:random_color_start` option

* 1.0.1
    - add help document

* 1.0.0
    - random colors
    - add good colors



## Recommended Color Schemes

1. Light Schemes
    * [pyte](http://github.com/therubymug/vim-pyte)
    * [eclipse](http://github.com/vim-scripts/eclipse.vim)
    * [summerfruit](http://github.com/vim-scripts/summerfruit.vim)
    * [AutumnLeaf](http://github.com/vim-scripts/autumnleaf_modified.vim)
    * [ironman](http://github.com/vim-scripts/ironman.vim)
    * [nuvola](http://github.com/vim-scripts/nuvola.vim)
    * [oceanlight](http://github.com/vim-scripts/oceanlight)
    * [simpleandfriendly](http://github.com/vim-scripts/simpleandfriendly.vim)
    * [mayansmoke](http://github.com/vim-scripts/mayansmoke)
1. Dark Schemes
    * [RGB256](http://github.com/alindeman/grb256)
    * [Distinguished](http://github.com/Lokaltog/vim-distinguished)
    * [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
    * [Railscasts](http://github.com/jpo/vim-railscasts-theme)
    * [Twilight](http://github.com/matthewtodd/vim-twilight)
    * [Vividchalk](http://github.com/tpope/vim-vividchalk)
    * [Candy](http://github.com/vim-scripts/candy.vim)
    * [ir_black](http://www.github.com/twerth/ir_black)
    * [molokai](http://www.github.com/tomasr/molokai)
    * [zenburn](http://github.com/jnurmine/Zenburn)
    * [desert](http://github.com/vim-scripts/desert.vim)
    * [gentooish](http://github.com/briancarper/gentooish.vim)
    * [wombat](http://github.com/cschlueter/vim-wombat)
    * wombat256
    * [peaksea](http://github.com/vim-scripts/peaksea)
1. Special Schemes
    * [lucius](http://github.com/jonathanfilip/vim-lucius)
    * [solarized](http://github.com/altercation/vim-colors-solarized)
    * [base16](http://github.com/chriskempson/base16-vim/)


See the following articles for more infomation

* [10 Vim Color Schemes You Need to Own](http://www.vimninjas.com/2012/08/26/10-vim-color-schemes-you-need-to-own/)
* [10 Light Vim Color Schemes That You Should Consider Using](http://www.vimninjas.com/2012/09/14/10-light-colors/)
* [Top Color Schemes](http://www.vim.org/scripts/script_search_results.php?keywords=&script_type=color+scheme&order_by=rating&direction=descending&search=search)


## All Vim Color Schemes

See https://github.com/flazz/vim-colorschemes for all color schemes.


