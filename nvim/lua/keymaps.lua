local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

local keys = {leader = '<leader>', enter = '<CR>', esc = '<ESC>', ret = '<return>'}

-- Keys Globals
keymap('', '<C-b>', ':NvimTreeToggle' .. keys.enter, opts)
keymap('i', 'jj', keys.esc, opts)
keymap('n', keys.leader .. 'V', ':vsplit' .. keys.enter, opts)
keymap('n', keys.esc, ':noh' .. keys.ret .. keys.esc, opts)

keymap('n', '<C-p>', ':Files' .. keys.enter, opts)
keymap('n', '<C-f>', ':Find' .. keys.enter, opts)

-- save and close
keymap('n', keys.leader .. 'w', ':w' .. keys.enter, opts)
keymap('n', keys.leader .. 'q', ':q' .. keys.enter, opts)

vim.cmd(
    "command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)")
vim.cmd([[
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
]])

-- *****************************************************************************
-- COC
-- *****************************************************************************
keymap('n', 'gd', '<Plug>(coc-definition)', {silent = true})
keymap('n', 'gh', ":call CocAction('doHover')<CR>", {noremap = true, silent = true})
keymap('n', 'gD', ":call CocAction('jumpDefinition', 'vsplit')<CR>", {silent = true})
keymap('n', '<leader>m', '<Plug>(coc-diagnostic-next)', {silent = true})
keymap('n', '<leader>n', '<Plug>(coc-diagnostic-next)', {silent = true})
keymap('n', '<leader>rn', '<Plug>(coc-rename)', {silent = true})
-- Use <c-space> to trigger completion.
keymap('i', '<C-Space>', 'coc#refresh()', {noremap = true, silent = true, expr = true})
keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], {noremap = true, expr = true})
keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], {noremap = true, expr = true})

-- *****************************************************************************
-- Fold
-- *****************************************************************************
keymap('n', 'zC', 'zM', opts)
keymap('n', 'zO', 'zR', opts)
keymap('n', 'zz', '<C-w>|', opts)

-- *****************************************************************************
-- Indentations
-- *****************************************************************************
-- Have the indent commands re-highlight the last visual selection to make
-- multiple indentations easier
keymap('v', '>', '>gv', {silent = true})
keymap('v', '<', '<gv', {silent = true})

-- *****************************************************************************
-- Sneak
-- *****************************************************************************
keymap('n', 'f', '<Plug>Sneak_f', {silent = true})
keymap('n', 'F', '<Plug>Sneak_F', {silent = true})
keymap('x', 'f', '<Plug>Sneak_f', {silent = true})
keymap('x', 'F', '<Plug>Sneak_F', {silent = true})
keymap('o', 'f', '<Plug>Sneak_f', {silent = true})
keymap('o', 'F', '<Plug>Sneak_F', {silent = true})

-- *****************************************************************************
-- Git
-- *****************************************************************************
keymap('n', '<leader>c', "<ESC>/\v^[<=>]{7}( .*|$)<CR>", opts)
