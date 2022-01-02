require('settings')
require('plugins')
require('customFunctions')

-- theme
require('theme')

-- keymap
require('keymaps')

-- init packages config

require('plugins.tree')
require('plugins.treesitter')
require('plugins.smallConfigs')
require('plugins.codi')
require('plugins.fzf')
require('plugins.startify')
require('plugins.multiCursor')
require('plugins.indentLines')


require('coc')
-- end packages config
