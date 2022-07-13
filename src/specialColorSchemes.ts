import { SpecialColorTheme } from './colorSchemes'

export const specialThemes: SpecialColorTheme[] = [
  // ayu
  {
    name: 'ayu_light',
    override: 'ayu',
    light: 1,
    dark: 0,
    airline: 'ayu',
    commandBeforeColo: 'let ayucolor="light"',
  },
  {
    name: 'ayu_mirage',
    override: 'ayu',
    light: 1,
    dark: 1,
    airline: 'ayu',
    commandBeforeColo: 'let ayucolor="mirage"',
  },
  {
    name: 'ayu_dark',
    override: 'ayu',
    light: 0,
    dark: 1,
    airline: 'ayu',
    commandBeforeColo: 'let ayucolor="dark"',
  },
]
