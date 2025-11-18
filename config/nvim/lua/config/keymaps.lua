-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<C-3>", "*''")

vim.keymap.set("n", "<C-3>", "<Cmd>keepjumps normal! mi*`i<CR>")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "<S-3>", "Nzz")
