-- options.lua
local opt = vim.opt

opt.formatoptions:remove "o"
opt.number = true -- show left number
opt.relativenumber = true -- make numbers relative to help jumping
opt.mouse = "a" -- enable mouse mode to resizing split
opt.showmode = false -- dont show status mode
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end) -- sync clipboard between OS and Neovim, :help clipboard
opt.breakindent = true -- enable break indent
opt.undofile = true -- save undo history
opt.ignorecase = true
opt.smartcase = true -- case-insensitive search /C
opt.signcolumn = "yes" -- keep signcolumn on by default
opt.updatetime = 250 -- decrease update time
opt.timeoutlen = 300 -- decrease mapped sequence wait time
opt.splitright = true -- new splits right
opt.splitbelow = true -- new split below
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split" -- preview substitutions live, as you type
opt.cursorline = true -- show which line your cursor is on
opt.scrolloff = 10 -- minimal number of screen lines to keep the cursor
opt.shada = { "'10", "<0", "s10", "h" }
