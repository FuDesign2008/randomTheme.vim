# randomTheme.vim

A plugin for switch color scheme and font, even on start up!

## Install & Usage

Before install this plugin, you should install

1. https://github.com/rafi/awesome-vim-colorschemes
1. (optional) https://github.com/vim-airline/vim-airline-themes
1. Some coding Fonts
   - Fonts are put in `./fonts` folder, just install the fonts.
   - see [./fonts/readme.md](./fonts/readme.md) for more

Then,

1. Install this plugin.
1. Open vim and execute `:RandomTheme` to enjoy!

## Configuration

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

### `g:favorite_gui_fonts`

The plugin will try to use default setting.

Note: Before using a font, you should install font on system by yourself.

```vim

let g:favorite_gui_fonts = [
            \ 'Monaco:h12',
            \ 'Fira\ Code:h12',
            \ 'Cascadia\ Code:h12',
            \ 'Ubuntu\ Mono:h14',
            \ 'Inconsolata:h13',
            \ 'Source\ Code\ Variable:h12',
            \ 'JetBrains\ Mono:h13',
            \ 'Consolas:h13'
            \]

```

### `g:random_theme_start`

The plugin will use a random color scheme and font when vim starting up by default.
If you want to disable this action, you can set the value of
`g:random_theme_start` in `.vimrc`. For example:

```vim

let g:random_theme_start = 0
colo pyte

```

Available values are here:

- `0` - Do not use
- `'all'` - Use a random color scheme in all, _default value_
- `'all:light'` - Use a random light color scheme in all
- `'all:dark'` - Use a random dark color scheme in all
- `'favorite'` - Use a random color scheme in favorite
- `'favorite:light'` - Use a random light color scheme in favorite
- `'favorite:dark'` - Use a random dark color scheme in favorite

## Commands

1. `:RandomFont` - select a font from `g:favorite_gui_fonts`
   - `:RandomFontZoom <size>` - zoom current font with extra size
   - `:RandomFontZoomReset` - reset current font size, equal to `:RandomFontZoom 0`
1. `:RandomTheme` - select a color scheme from all available schemes and run `:RandomFont`
   - `:RandomTheme` select a color scheme
   - `:RandomTheme dark` select a dark color scheme
   - `:RandomTheme light` select a light color scheme
   - `:RandomTheme $shemeName` select a special color scheme
1. `:RandomThemeFavorite` - select a color scheme from the schemes in `g:favorite_color_schemes` and run `:RandomFont`
   - `:RandomThemeFavorite` select a color scheme
   - `:RandomThemeFavorite dark` select a favorite dark color scheme
   - `:RandomThemeFavorite light` select a favorite light color scheme
   - `:RandomThemeFavorite $schemeName` select a special favorite color scheme

## Change Log

- 2023-06-21
  - add `:RandomFontZoom <size>` and `:RandomFontZoomReset` Commands
- 2022-07-14
  - use https://github.com/rafi/awesome-vim-colorschemes
  - add support for `:RandomTheme ${schemeName}` /`:RandomFavorite ${schemeName}`
  - change airline theme when run `:RandomTheme` / `:RandomFavorite`
- 2020-09-22
  - update `:RandomFavorite` command
- 2020-04-22
  - add `JetBrains Mono` font
- 2020-01-10
  - add `:RandomThemeFavorite` command
  - remove `:RandomColor` command
- 2019-12-09
  - Remove font `Iosevka`
- 2019-09-23
  - Rename to `randomTheme.vim`
  - add `:RandomTheme` command
  - add `g:favorite_gui_fonts`
  - remove `:RandomAll`, `:RandomFavorite` commands
- 2015-11-23
  - Every color scheme will be matched in each round
- 2015-11-03
  - Rename `g:random_color_schemes` to `g:favorite_color_schemes`
  - add `:RandomFavorite`, `:RandomAll` commands
- 2015-02-07
  - Rename to `randomColor.vim`
- 1.0.2
  - add `g:random_theme_start` option
- 1.0.1
  - add help document
- 1.0.0
  - random colors
  - add good colors
