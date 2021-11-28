-- Use native clipboard
vim.cmd("set clipboard^=unnamedplus")

-- Config General
vim.cmd("set cursorline")
vim.cmd("set mouse=a")
vim.cmd("set number")
vim.cmd("set termguicolors")
vim.cmd("set hidden")
vim.cmd("set nopaste")
vim.cmd("set splitright")
vim.cmd("set completeopt-=preview")

-- Leader
vim.cmd('let mapleader=" "')

-- Indentation
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- command line completion
vim.cmd("set wildmode=longest:list,full")

-- backspace and cursor keys wrap too
vim.cmd("set whichwrap=b,s,h,l,<,>,[,]")

-- highlight matching parenthesis
vim.cmd("set showmatch")

vim.cmd("set nobackup")
vim.cmd("set noerrorbells")
vim.cmd("set noswapfile")

-- encoding
vim.cmd("set encoding=utf-8")
vim.cmd("set fileencoding=utf-8")
vim.cmd("set fileencodings=utf-8")

-- Always show signcolumns
vim.cmd("set signcolumn=yes")

-- Folds
vim.cmd("set foldmethod=syntax")
vim.cmd("set foldlevelstart=99")

-- Coc enhancements
vim.cmd("set cmdheight=1")
vim.cmd("set updatetime=300")

-- set case insensitive searching
vim.cmd("set ignorecase")
-- case sensitive searching when not all lowercase
vim.cmd("set smartcase")
-- Live replacing using %s/text/newText
vim.cmd("set inccommand=split")
