/**
 *
 * @author fuyg
 * @date  2020-01-10
 */

const fs = require('fs')
const path = require('path')

const colorSchemePath = '/Users/fuyg/.vim/bundle/vim-colorschemes/colors'
const jsonData = []


function getAllFiles() {
  const files = fs.readdirSync(colorSchemePath)
  return files
}

function isLight(content) {
  const lightModes = ['set background=light', 'set bg=light']

  return lightModes.some((item) => content.indexOf(item) > -1)
}

function detectColorScheme(filePath) {
  const fullPath = path.resolve(colorSchemePath, filePath)
  console.log('fullPath', fullPath)
  const content = fs.readFileSync(fullPath)
  const light = isLight(content)
  const parsed = path.parse(fullPath)
  jsonData.push({
    name: parsed.name,
    light: light ? 1 : 0,
  })
}

// start
const files = getAllFiles()
files.forEach((file) => {
  detectColorScheme(file)
})

const jsonDataAsString = JSON.stringify(jsonData)

fs.writeFileSync('./colorschemes.json', jsonDataAsString)
