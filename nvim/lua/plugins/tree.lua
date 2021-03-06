require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
    ignore_ft_on_setup = {},
    auto_close = true,
    open_on_tab = true,
    hijack_cursor = false,
    update_cwd = false,
    update_to_buf_dir = {enable = true, auto_open = true},
    diagnostics = {
        enable = false,
        icons = {hint = "", info = "", warning = "", error = ""}
    },
    update_focused_file = {enable = true, update_cwd = false, ignore_list = {"node_modules", ".git"}},
    system_open = {cmd = nil, args = {}},
    filters = {dotfiles = false, custom = {}},
    git = {enable = true, ignore = false, timeout = 500},
    view = {
        width = 30,
        height = 30,
        hide_root_folder = true,
        side = 'left',
        auto_resize = true,
        mappings = {custom_only = false, list = {}},
        number = false,
        relativenumber = false
    },
    trash = {cmd = "trash", require_confirm = true}
}
