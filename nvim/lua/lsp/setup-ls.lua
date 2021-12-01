local DATA_PATH = vim.fn.stdpath('data')

local function documentHighlight(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
    end
end

-- *****************************************************************************
-- BASH
-- *****************************************************************************
require'lspconfig'.bashls.setup {
    cmd = {DATA_PATH .. "/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
    filetypes = {"sh", "zsh"}
}

-- *****************************************************************************
-- GO
-- *****************************************************************************
require'lspconfig'.gopls.setup {
    cmd = {"gopls"},
    filetypes = {"go", "gomod"},
    root_dir = root_pattern("go.mod", ".git")
}

-- *****************************************************************************
-- DART
-- *****************************************************************************
require'lspconfig'.dartls.setup {init_options = {documentFormatting = true}}

-- *****************************************************************************
-- SVELTE
-- *****************************************************************************
require('lspconfig').svelte.setup {
    cmd = {DATA_PATH .. "/lspinstall/svelte/node_modules/.bin/svelteserver", "--stdio"},
    filetypes = {"svelte"},
    root_dir = require("lspconfig.util").root_pattern("package.json", ".git"),
    on_attach = documentHighlight
}

-- *****************************************************************************
-- TYPESCRIPT
-- *****************************************************************************
require'lspconfig'.tsserver.setup {
    cmd = {
        DATA_PATH .. "/lspinstall/typescript/node_modules/.bin/typescript-language-server",
        "--stdio"
    },
    on_attach = documentHighlight,
    -- This makes sure tsserver is not used for formatting (I prefer prettier)
    -- on_attach = require'lsp'.common_on_attach,
    settings = {documentFormatting = false}
}

-- *****************************************************************************
-- ESLINT
-- *****************************************************************************
require'lspconfig'.eslint.setup {
    cmd = {"vscode-eslint-language-server", "--stdio"},
    filetypes = {
        "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact",
        "typescript.tsx", "vue"
    },
    handlers = {
        ["eslint/confirmESLintExecution"] = "<function 1>",
        ["eslint/noLibrary"] = "<function 2>",
        ["eslint/openDoc"] = "<function 3>",
        ["eslint/probeFailed"] = "<function 4>"
    },
    on_new_config = function(config, new_root_dir)
        -- The "workspaceFolder" is a VSCode concept. It limits how far the
        -- server will traverse the file system when locating the ESLint config
        -- file (e.g., .eslintrc).
        config.settings.workspaceFolder = {
            uri = new_root_dir,
            name = vim.fn.fnamemodify(new_root_dir, ':t')
        }
    end,
    root_dir = function(startpath)
        return M.search_ancestors(startpath, matcher)
    end,
    settings = {
        codeAction = {
            disableRuleComment = {enable = true, location = "separateLine"},
            showDocumentation = {enable = true}
        },
        codeActionOnSave = {enable = false, mode = "all"},
        format = true,
        nodePath = "",
        onIgnoredFiles = "off",
        packageManager = "npm",
        quiet = false,
        rulesCustomizations = {},
        run = "onType",
        useESLintClass = false,
        validate = "on",
        workingDirectory = {mode = "location"}
    }
}

-- *****************************************************************************
-- LUA
-- *****************************************************************************
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
local sumneko_root_path = DATA_PATH .. "/lspinstall/lua"
local sumneko_binary = sumneko_root_path .. "/sumneko-lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = documentHighlight,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim) version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                },
                maxPreload = 10000
            }
        }
    }
}
