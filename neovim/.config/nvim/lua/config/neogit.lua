local nnoremap = require("keymap-setup").nnoremap
local neogit = require "neogit"

neogit.setup {}

nnoremap("<leader>gs", function() neogit.open {} end)
--nnoremap("<leader>f", "<cmd>!git fetch --all<CR>")
