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

vim.keymap.set({ "n", "x", "o" }, "]z", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer")
end, { desc = "Next IF" })

vim.keymap.set({ "n", "x", "o" }, "[z", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer")
end, { desc = "Prev IF" })

vim.keymap.set({ "n", "x", "o" }, "]Z", function()
    require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer")
end, { desc = "Next FOR / WHILE" })
vim.keymap.set({ "n", "x", "o" }, "[Z", function()
    require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer")
end, { desc = "Prev FOR / WHILE" })
