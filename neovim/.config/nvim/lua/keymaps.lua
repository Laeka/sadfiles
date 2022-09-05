local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "x", '"_x', opts)
-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers:CHECK
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)

--QUIT, close buffers, etc
keymap("n", "<leader>q", "<cmd>qa<cr>", opts)
keymap("n", "<leader>x", "<cmd>q!<cr>", opts)
keymap("n", "<leader>d", "<cmd>Sayonara<cr>", { silent = true, nowait = true, noremap = true })

--Save buffer
keymap("n", "<leader>w", "<cmd>w<cr>", opts)

-- Tab movement
--[[ map('n', '<c-Left>', '<cmd>tabpre<cr>', silent) ]]
--[[ map('n', '<c-Right>', '<cmd>tabnext<cr>', silent) ]]

-- Version Control : git
keymap("n", "gs", "<cmd>Neogit<cr>", opts)

-- Insert --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

--Save buffer
keymap("i", "<c-s>", "<esc><cmd>w<cr>a", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--nvim tree
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts)

-- Custom

-- toggle bool word - true/false
keymap(
  "n",
  "gtb",
  ":lua require('funcs').toggle_bool({word=vim.fn.expand('<cword>')})<CR>",
  { noremap = true, silent = true }
)
keymap("v", "<leader>t", [[<Cmd>lua require'funcs'.create_todoist_task()<CR>]], { noremap = false })
-- clear nvim-notify notifications history
keymap("n", "<leader>cn", ":lua require('funcs').clear_notification_history()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>ti", ":lua require('funcs').notify_current_datetime()<CR>", { noremap = true, silent = true })
keymap("n", "<leader>gf", ":vs <cfile><CR>", { noremap = false, silent = true })
keymap("n", "<leader>t", ":TSHighlightCapturesUnderCursor<CR>", { noremap = true, silent = true })
-- toggle neoclip - https://github.com/AckslD/nvim-neoclip.lua#startstop
keymap("n", ",tn", [[<Cmd>lua require('neoclip').toggle()<CR>]], { noremap = true, silent = true })
-- open new Neovim Terminal in vsplit or split
keymap("n", "<leader>tv", [[<Cmd>vsp <bar>terminal<CR>]], { noremap = false, silent = true })
-- open short terminal at the bottom of the buffer
keymap("n", "<leader>ts", [[<Cmd>11sp <bar>terminal<CR>]], { noremap = false, silent = true })
-- open lazygit in vert split - custom lazygit config uses ctrl-x as menu close
--keymap("n", "<space>lg", [[<Cmd>135vsp <bar>terminal lazygit<CR>]], { noremap = true, silent = true })
-- yank all in buffer
keymap("n", "<leader>a", ":%y<cr>", { noremap = false, silent = true })
