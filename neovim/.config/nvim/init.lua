-- https://github.com/lewis6991/impatient.nvim
-- :LuaCacheClear
require "impatient"

local g = vim.g
-- Skip some remote provider loading
g.loaded_python3_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Disable some built-in plugins we don't want
local disabled_built_ins = {
  "gzip",
  "man",
  "matchit",
  "matchparen",
  "shada_plugin",
  "tarPlugin",
  "tar",
  "zipPlugin",
  "zip",
  --"netrwPlugin",
}

for i = 1, 9 do
  g["loaded_" .. disabled_built_ins[i]] = 1
end

-- Autocommands
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
autocmd("VimEnter", {
  group = augroup("start_screen", { clear = true }),
  once = true,
  callback = function() require("start").start() end,
})
local misc_aucmds = augroup("misc_aucmds", { clear = true })
autocmd("BufWinEnter", { group = misc_aucmds, command = "checktime" })
autocmd("TextYankPost", {
  group = misc_aucmds,
  callback = function() vim.highlight.on_yank() end,
})
autocmd("FileType", { group = misc_aucmds, pattern = "qf", command = "set nobuflisted" })

require "plugins"
require "settings"
require "keymaps"
require "lsp"