export interface ColorScheme {
  name: string
  light: 0 | 1
  dark: 0 | 1
}

export interface ColorTheme extends ColorScheme {
  airline: string
  // before run colorschemes command
  commandBeforeColo: string
}

export interface SpecialColorTheme extends ColorTheme {
  override: string
}

export type MixedColorTheme = ColorTheme | SpecialColorTheme
