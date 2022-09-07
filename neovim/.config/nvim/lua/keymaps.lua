local Remap = require "keymap"
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

--Remap space as leader key
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Normal --
-- Better window navigation
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers:CHECK
nnoremap("<S-l>", ":bnext<CR>")
nnoremap("<S-h>", ":bprevious<CR>")

-- Move text up and down
nnoremap("<A-j>", "<Esc>:m .+1<CR>")
nnoremap("<A-k>", "<Esc>:m .-2<CR>")

--QUIT, close buffers, etc
nnoremap("<leader>q", "<cmd>qa<cr>")
nnoremap("<leader>x", "<cmd>q!<cr>")
nnoremap("<leader>d", "<cmd>Sayonara<cr>")

--Save buffer
nnoremap("<leader>w", "<cmd>w<cr>")

-- Insert --
-- Press jk fast to exit insert mode
inoremap("jk", "<ESC>")

-- Visual --
-- Stay in indent mode
vnoremap(">", ">gv")
vnoremap("<", "<gv")

-- Move text up and down
vnoremap("<A-j>", ":m .+1<CR>==")
vnoremap("<A-k>", ":m .-2<CR>==")
vnoremap("p", '"_dP')

-- Visual Block --
-- Move text up and down
xnoremap("J", ":move '>+1<CR>gv-gv")
xnoremap("K", ":move '<-2<CR>gv-gv")
xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
xnoremap("<A-k>", ":move '<-2<CR>gv-gv")

-- Custom
-- toggle bool word - true/false
nnoremap("gtb", ":lua require('funcs').toggle_bool({word=vim.fn.expand('<cword>')})<CR>")
-- clear nvim-notify notifications history
nnoremap("<leader>cn", ":lua require('funcs').clear_notification_history()<CR>")
nnoremap("<leader>ti", ":lua require('funcs').notify_current_datetime()<CR>")
nnoremap("<leader>th", ":TSHighlightCapturesUnderCursor<CR>")
-- open new Neovim Terminal in vsplit or split
nmap("<leader>tv", [[<Cmd>vsp <bar>terminal<CR>]])
-- open short terminal at the bottom of the buffer
nmap("<leader>ts", [[<Cmd>11sp <bar>terminal<CR>]])
-- open lazygit in vert split - custom lazygit config uses ctrl-x as menu close
--keymap("n", "<space>lg", [[<Cmd>135vsp <bar>terminal lazygit<CR>]], { noremap = true, silent = true })
-- yank all in buffer
nmap("<leader>a", ":%y<cr>")
-- v split create cursor file
nnoremap("<leader>vs", ":vs <cfile><CR>")
-- netrw toogle
nnoremap("<leader>trw", ":Ex<CR>")
--Undo tree show
nnoremap("<leader>ut", ":UndotreeToggle<CR>")
