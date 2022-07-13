/**
 *
 * @author fuyg
 * @date  2020-01-10
 */

const fs = require('fs')
const path = require('path')

import { ColorScheme, ColorTheme } from './colorSchemes'
import { specialThemes } from './specialColorSchemes'

const colorSchemePath =
  '/Users/fuyg/.vim/bundle/awesome-vim-colorschemes/colors'
const airlineThemePath =
  '/Users/fuyg/.vim/bundle/awesome-vim-colorschemes/autoload/airline/themes'
const colorSchemeJson = './plugin/colors.json'
const airlineThemeJson = './plugin/airline.json'
const colorThemeJson = './plugin/colorschemes.json'

function writeJsonFile(filePath: string, data: any): void {
  const jsonDataAsString = JSON.stringify(data)
  fs.writeFileSync(filePath, jsonDataAsString)
}

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
  const name = parsed.name

  if (!dark && !light) {
    return {
      name,
      light: 1,
      dark: 1,
    }
  } else {
    return {
      name,
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

  writeJsonFile(colorSchemeJson, colorSchemes)
  return colorSchemes
}

//  fileName:  afterglow.vim
function detectAirlineTheme(fileName: string): string {
  console.log('detectAirlineTheme fileName:', fileName)
  const name = fileName.replace(/\.vim$/, '')
  return name
}

function getAirlineThemes(): string[] {
  const files = getFilesOfDir(airlineThemePath)
  const themes = files.map((file) => {
    return detectAirlineTheme(file)
  })

  writeJsonFile(airlineThemeJson, themes)
  return themes
}

function createData(): void {
  const colorThemes: ColorTheme[] = []

  const schemes = getColorSchemes()
  const airlineThemes = getAirlineThemes()
  schemes.forEach((scheme) => {
    const found = specialThemes.find((item) => item.override === scheme.name)
    if (found) {
      return
    }
    const airline = airlineThemes.find(
      (themeItem) => themeItem.toLowerCase() === scheme.name.toLowerCase(),
    )
    const theme: ColorTheme = {
      ...scheme,
      commandBeforeColo: '',
      airline: airline ? airline : '',
    }
    if (!theme) {
      return
    }
    const themeName = theme.name
    const foundTheme = colorThemes.find((item) => item.name === themeName)
    if (foundTheme) {
      return
    }
    colorThemes.push(theme)
  })

  specialThemes.forEach((special) => {
    const themeName = special.name
    const foundTheme = colorThemes.find((item) => item.name === themeName)
    if (foundTheme) {
      return
    }
    colorThemes.push(special)
  })

  writeJsonFile(colorThemeJson, colorThemes)
}

// run
createData()
