-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Zed-like keymaps (normal mode) to mirror your workflow.
map("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<C-B>", "<cmd>Neotree toggle left<cr>", { desc = "Toggle left dock" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>bd<cr>", { desc = "Close active buffer" })
map("n", "<leader><space>", function()
  if Snacks and Snacks.picker then
    Snacks.picker.files()
  else
    vim.cmd("find .")
  end
end, { desc = "File finder" })
map("n", "<C-p>", function()
  if Snacks and Snacks.picker then
    Snacks.picker.files()
  else
    vim.cmd("find .")
  end
end, { desc = "VSCode: Quick Open" })
map({ "n", "i" }, "<C-s>", "<cmd>w<cr>", { desc = "VSCode: Save" })
map("n", "<C-w>", "<cmd>bd<cr>", { desc = "VSCode: Close editor" })

-- Zed: ctrl-shift-i => format.
map({ "n", "v" }, "<C-S-I>", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format" })
