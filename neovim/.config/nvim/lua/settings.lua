local g = vim.g
g.loaded_matchparen = 1
-- Better Netrw
g.netrw_banner = 1 -- Hide banner
g.netrw_browse_split = 3 -- Open in previous window
g.netrw_altv = 1 -- Open with right splitting
g.netrw_liststyle = 3 -- Tree-style view
g.netrw_list_hide = (vim.fn["netrw_gitignore#Hide"]()) .. [[,\(^\|\s\s\)\zs\.\S\+]] -- use .gitignore
g.netrw_winsize = 25

--options
local options = {
  fileencoding = "utf-8", -- the encoding written to a file
  title = true, -- title of the window
  smartindent = true, -- make indenting smarter again
  hlsearch = false, -- highlight all matches on previous search pattern
  backup = false, --create a backup file
  cmdheight = 2, --more space in the neovim command for display messages
  expandtab = true, --convert tabs to spaces
  scrolloff = 8, --number to show below the cursor :Check need to test
  ignorecase = true, -- Case insensitive searching UNLESS /C or capital in search
  breakindent = true, --:Check need test
  shiftwidth = 2, --the number of spaces inserted for each indentation
  wrap = true, -- No Wrap lines
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- just for completeopt
  -- conceallevel = 0 :CHECK `` visible for markdown files = need test
  mouse = "a", --allow mouse in vim
  pumheight = 10, --pop up menu height
  showmode = false, -- dessapear INSERT NORMAL VISUAL mode
  showtabline = 2, --always show tabs
  smartcase = true, --:Check = need test
  splitbelow = true, --force all horizontal splits to go below current window
  splitright = true, --force all vertical splits to go right of current window
  swapfile = false, --create swap files
  timeoutlen = 1000, --time to wait for a mapped sequence to completeopt
  undofile = true, --enable persistent undofile
  updatetime = 1000, --faster competion
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  tabstop = 2, --insert 2 spaces for a tabs
  --cursorline = true, --highlight the cursor line
  number = true, --set numbered lines
  relativenumber = true, --set relative numbered lines
  numberwidth = 4, --set number column width to 2
  signcolumn = "yes:1", -- always show the signcolumn, otherwise it would shift the text each time
  sidescrolloff = 8,
  inccommand = "split",
  lazyredraw = true, --something with screen wrap
  showmatch = true, --jump to match bracker when is inserted only happen if the match can be seen on the screen
  softtabstop = 0, -- number of space tab counts while editing
  laststatus = 3, --max status lines for windows
  hidden = true, --buffer becomes hidden when it is abandones
  joinspaces = false, --:CHECK maybe deprecated
  previewheight = 5, --default height for a preview window
  synmaxcol = 500, --
  display = "msgsep", --change the way text is displayed :: lastline - truncate - uhex - msgsep
  modeline = false, -- lines checked for set commands if is on
  colorcolumn = "80",

  --Colorscheme
  termguicolors = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

local opt = vim.opt

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.belloff = "all" -- Just turn the dang bell off
opt.path:append { "**" } -- Finding files - Search down into subfolders
opt.wildignore:append { "*.o", "*~", "*/node_modules/*" }
opt.shortmess:append "c"
opt.diffopt = { "internal", "filler", "closeoff", "hiddenoff", "algorithm:minimal" }
opt.shada = { "!", "'1000", "<50", "s10", "h" }

--vim scripts
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[autocmd FileType help,qf,fugitive,fugitiveblame,netrw nnoremap <buffer><silent> q :close<CR>]]
