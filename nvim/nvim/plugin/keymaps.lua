-- keymaps.lua
local keymap = vim.keymap.set

-- clear highlight on search
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>")

keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
-- keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--
keymap("i", "jk", [[<C-\><C-n>]], { desc = "Use jk instead of Esc" })
keymap("n", "<S-j>", ":move .+1<CR>==", { desc = "Move text down" })
keymap("n", "<S-k>", ":move  .-2<CR>==", { desc = "Move text up" })
keymap("x", "<S-j>", ":move '>+1<CR>gv-gv", { desc = "Move text down" })
keymap("x", "<S-k>", ":move  '<-2<CR>gv-gv", { desc = "Move text up" })
keymap("n", "<C-s>", "<cmd>vsplit<cr>", { desc = "New horizontal window" })
-- These mappings control the size of splits (height/width)
keymap("n", "<C-,>", "<c-w>5<")
keymap("n", "<C-.>", "<c-w>5>")
