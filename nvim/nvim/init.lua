-- Set <space> as the leader key, :help mapleade
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- WARN: porque no funciona esto desde lua/config/options.lua?
vim.opt.formatoptions:remove { "o", "r" }

-- [[ Basic Autocommands ]], :help lua-guide-autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Lazy.nvim plugin manager ]], :help lazy.nvim.txt or https://github.com/folke/lazy.nvim
require "config.lazy"
