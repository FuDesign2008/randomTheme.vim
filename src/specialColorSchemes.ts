import { SpecialColorTheme } from './colorSchemes'

// 特殊的处理
export const specialThemes: SpecialColorTheme[] = [
  // ayu
  {
    name: 'ayu_light',
    override: 'ayu',
    light: 1,
    dark: 0,
    airline: 'ayu',
    commandBeforeColo: 'let g:ayucolor="light"',
  },
  {
    name: 'ayu_mirage',
    override: 'ayu',
    light: 1,
    dark: 1,
    airline: 'ayu',
    commandBeforeColo: 'let g:ayucolor="mirage"',
  },
  {
    name: 'ayu_dark',
    override: 'ayu',
    light: 0,
    dark: 1,
    airline: 'ayu',
    commandBeforeColo: 'let g:ayucolor="dark"',
  },
]

// 在实际使用中遇到了问题， 禁用之
export const disabledColorSchemes: string[] = ['rakr']
