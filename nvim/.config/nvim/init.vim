set number
set mouse=a                                                                                         
set numberwidth=1                                                                                   
set clipboard=unnamed
syntax on
set showcmd
set ruler
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
set laststatus=2

"colorscheme oceanic_material
"let g:oceanic_material_background='darker'

let g:gruvbox_contrast = "hard"
let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox
"highlight Normal ctermbg=NONE

"let g:material_theme_style = 'ocean'
"let g:lightline = { 'colorscheme': 'material_vim' }
"colorscheme material

"True Color
" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
 if (has('nvim'))
   let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
 endif

  " For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
  if (has('termguicolors'))
    set termguicolors
  endif

if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

