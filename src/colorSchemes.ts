export interface ColorScheme {
  name: string
  light: 0 | 1
  dark: 0 | 1
}

export interface ColorTheme extends ColorScheme {
  airlineTheme: string
  airlineCommand: string
}

export interface SpecialColorTheme extends ColorTheme {
  overrideName: string
  overrideAirline: string
}

export type MixedColorTheme = ColorTheme | SpecialColorTheme
