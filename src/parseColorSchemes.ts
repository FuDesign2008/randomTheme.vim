/**
 *
 * @author fuyg
 * @date  2020-01-10
 */

const fs = require('fs')
const path = require('path')

import { ColorScheme, ColorTheme } from './colorSchemes'
import { specialThemes } from './specialColorSchemes'

const colorSchemePath = '/Users/fuyg/.vim/bundle/vim-colorschemes/colors'
const colorSchemeJson = './color-scheme.json'
const airlineThemeJson = './airline-theme.json'
const colorThemeJson = './color-theme.json'

function getFilesOfDir(filePath: string) {
  const files = fs.readdirSync(filePath) as string[]
  return files
}

function isLight(content: string): boolean {
  const modes = ['set background=light', 'set bg=light']
  return modes.some((item) => content.indexOf(item) > -1)
}

function isDark(content: string): boolean {
  const modes = ['set background=dark', 'set bg=dark']
  return modes.some((item) => content.indexOf(item) > -1)
}

function detectColorScheme(filePath: string): ColorScheme {
  const fullPath = path.resolve(colorSchemePath, filePath)
  console.log('fullPath', fullPath)
  const content = fs.readFileSync(fullPath)
  const light = isLight(content)
  const dark = isDark(content)
  const parsed = path.parse(fullPath)

  if (!dark && !light) {
    return {
      name: parsed.name,
      light: 1,
      dark: 1,
    }
  } else {
    return {
      name: parsed.name,
      light: light ? 1 : 0,
      dark: dark ? 1 : 0,
    }
  }
}

function getColorSchemes(): ColorScheme[] {
  const files = getFilesOfDir(colorSchemePath)
  const colorSchemes = files.map((file) => {
    return detectColorScheme(file)
  })

  const jsonDataAsString = JSON.stringify(colorSchemes)

  fs.writeFileSync(colorSchemeJson, jsonDataAsString)
  return colorSchemes
}

function detectAirlineTheme(filePath: string): string {
  // TODO
}

function getAirlineThemes(): string[] {
  const files = getFilesOfDir(colorSchemePath)
  const themes = files.map((file) => {
    return detectAirlineTheme(file)
  })

  const jsonDataAsString = JSON.stringify(themes)

  fs.writeFileSync(airlineThemeJson, jsonDataAsString)
  return themes
}

function createData(): void {
  const colorThemes: ColorTheme[] = []

  const schemes = getColorSchemes()
  const airlineThemes = getAirlineThemes()
  schemes.forEach((scheme) => {
    const found = specialThemes.find(
      (item) => item.overrideName === scheme.name,
    )
    let theme: ColorTheme | null = null
    if (found) {
      theme = {
        ...found,
      }
    } else {
      const airlineTheme = airlineThemes.includes(scheme.name)
        ? scheme.name
        : ''
      const airlineCommand = airlineTheme ? 'TODO' : ''
      theme = {
        ...scheme,
        airlineTheme,
        airlineCommand,
      }
    }
    if (!theme) {
      return
    }
  })
}
