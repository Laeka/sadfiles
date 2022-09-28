local g = vim.g
local opt = vim.opt
g.loaded_matchparen = 1
-- Better Netrw
g.netrw_banner = 0 -- Hide banner
g.netrw_browse_split = 0 -- Open in previous window
g.netrw_winsize = 25

--options
local options = {
  smartindent = true, -- make indenting smarter again
  tabstop = 2, --insert 2 spaces for a tabs
  softtabstop = 2, -- number of space tab counts while editing
  shiftwidth = 2, --the number of spaces inserted for each indentation
  expandtab = true, --convert tabs to spaces
  showtabline = 2, --always show tabs

  fileencoding = "utf-8", -- the encoding written to a file
  scrolloff = 8, --number to show below the cursor :Check need to test
  hlsearch = false, -- highlight all matches on previous search pattern
  incsearch = true,
  backup = false, --create a backup file
  wrap = false, -- No Wrap lines
  showmode = false, -- dessapear INSERT NORMAL VISUAL mode
  swapfile = false, --create swap files
  undofile = true, --enable persistent undofile
  timeoutlen = 1000, --time to wait for a mapped sequence to completeopt
  updatetime = 50, --faster competion
  number = true, --set numbered lines
  relativenumber = true, --set relative numbered lines
  signcolumn = "yes:1", -- always show the signcolumn, otherwise it would shift the text each time
  cmdheight = 1, --more space in the neovim command for display messages
  colorcolumn = "80",
  guicursor = "",
  belloff = "all",
  --Colorscheme
  termguicolors = true,

  --Highlight line
  cursorline = true,
  winblend = 0,
  pumblend = 5,
  background = "dark",
}

for k, v in pairs(options) do
  opt[k] = v
end

opt.path:append { "**" } -- Finding files - Search down into subfolders
-- "*.o", "*~",
opt.wildignore:append {"*.o","*~","*/node_modules/*"}
opt.shortmess:append "c"
opt.isfname:append("@-@")

--vim scripts
