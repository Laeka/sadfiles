local map = vim.api.nvim_set_keymap
local g = vim.g

-- 2-character Sneak (default)
local opts = { noremap = false }
-- repeat motion
map("", ";", "<Plug>Sneak_;", opts)
map("", [[\]], "<Plug>Sneak_,", opts)

g["sneak#s_next"] = 1
g["sneak#label"] = 1
g["sneak#use_ic_scs"] = 1
