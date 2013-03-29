GoodColors.vim
==============

Good color schemes for vim

###Color Schemes
These color schemes are supported:
1. fudesign, depending on [ir_black](http://www.github.com/twerth/ir_black)
1. jelly, depending on [jellybeans](http://www.github.com/nanotech/jellybeans.vim)
1. molo, depending on [molokai](http://www.github.com/tomasr/molokai)

###Random Favorite Color Schemes
Using one single favorite color scheme is good, but sometimes is toneless. More than
one favorite color schemes are tasteful. Randoming favorites is better.
By default, the `./plugin/randomColorSchemes.vim` will random color schemes in
`./colors` folder of `GoodColors.vim`.

If you want to addd other colors, yon can put these codes into `.vimrc`:

```vim
let g:favoriteColorSchemes = ['fudesign', 'jelly', 'molo', 'other1', 'other2']
```

