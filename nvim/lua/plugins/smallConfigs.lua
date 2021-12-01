-- Vim Sneak
vim.g['sneak#s_next'] = 1
vim.g['sneak#label'] = 1

-- Vim Move
-- <C-k>   Move current line/selections up
-- <C-j>   Move current line/selections down
vim.g.move_key_modifier = 'C'

-- Git Signs
require('gitsigns').setup()
require'colorizer'.setup()

-- Lualine
require'lualine'.setup {
    options = {theme = 'auto'},
    sections = {
        lualine_a = {{'mode', lower = false}},
        lualine_b = {'filename'},
        lualine_c = {
            {
                'diagnostics',
                sources = {"nvim_lsp"},
                symbols = {error = 'E:', warn = 'W:', info = 'I:', hint = 'H:'}
            }
        },
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'branch'}
    }
}
