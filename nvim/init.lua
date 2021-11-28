require('settings')
require('plugins')
require('customFunctions')

-- theme
require('theme.theme')
require('theme.colors')

-- keymap
require('keymaps')

-- init packages config

require('plugins.nerdtree')
require('plugins.treesitter')
require('plugins.smallConfigs')
require('plugins.codi')
require('plugins.fzf')
require('plugins.startify')
require('plugins.multiCursor')
require('plugins.indentLines')

-- LSP
require('lsp')
require('lsp.setup')

require('plugins.cmp')
require('plugins.lspConfig')

-- end packages config

