set number
set mouse=a                              
set numberwidth=1                                                          
set clipboard=unnamed
syntax on
set showcmd
set ruler
set ttimeoutlen=100
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
so $HOME/.config/nvim/vimConfigs/plugins.vim
so $HOME/.config/nvim/vimConfigs/plugin-config.vim
so $HOME/.config/nvim/vimConfigs/maps.vim
so $HOME/.config/nvim/vimConfigs/coc-config.vim


"Themes
so $HOME/.config/nvim/vimConfigs/themes/gruvbox.vim
"so $HOME/.config/nvim/vimConfigs/themes/material.vim
"so $HOME/.config/nvim/vimConfigs/themes/oceanic_material.vim

"True Colors
so $HOME/.config/nvim/vimConfigs/themes/trueColors.vim

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

