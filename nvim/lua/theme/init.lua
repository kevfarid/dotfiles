require('theme.colors')

local colorSchemes = {
    ayu = 'ayu',
    cobalt = 'cobalt2',
    dracula = 'dracula',
    draculaPro = 'dracula_pro',
    gruvbox = 'gruvbox',
    gruvboxMaterial = 'gruvbox-material',
    materialMonokai = 'material-monokai',
    monokaiPro = 'monokai_pro',
    nightOwl = 'night-owl',
    nord = 'nord',
    nova = 'nova',
    one = 'one',
    oneHalfDark = 'onehalfdark',
    paperColor = 'PaperColor',
    quantum = 'quantum',
    tokyoNight = 'tokyonight',
    oneDark = 'onedark',
    palenight = 'palenight',
    material = 'material',
    rosepine = 'rose-pine'
}

vim.cmd(string.format('colorscheme ' .. colorSchemes.rosepine))
