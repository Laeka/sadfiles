--options
local options = {
  fileencoding = "utf-8", -- the encoding written to a file
  title = true, -- title of the window
  smartindent = true, -- make indenting smarter again
  hlsearch = true, -- highlight all matches on previous search pattern
  backup = false, --create a backup file
  cmdheight = 2, --more space in the neovim command for display messages
  expandtab = true, --convert tabs to spaces
  scrolloff = 8, --number to show below the cursor :Check need to test
  ignorecase = true, -- Case insensitive searching UNLESS /C or capital in search
  breakindent = true, --:Check need test
  shiftwidth = 2, --the number of spaces inserted for each indentation
  wrap = false, -- No Wrap lines
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
  updatetime = 100, --faster competion
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  tabstop = 2, --insert 2 spaces for a tabs
  --cursorline = true, --highlight the cursor line
  number = true, --set numbered lines
  relativenumber = true, --set relative numbered lines
  numberwidth = 4, --set number column width to 2
  signcolumn = "yes:1", -- always show the signcolumn, otherwise it would shift the text each time
  sidescrolloff = 8,
  inccommand = "nosplit",
  wildmode = "longest,full",
  lazyredraw = true, --something with screen wrap
  showmatch = true, --jump to match bracker when is inserted only happen if the match can be seen on the screen
  softtabstop = 0, -- number of space tab counts while editing
  laststatus = 3, --max status lines for windows
  -- shada = [['20, <50, s10, /100]], --register of the files
  hidden = true, --buffer becomes hidden when it is abandones
  joinspaces = false, --:CHECK maybe deprecated
  previewheight = 5, --default height for a preview window
  synmaxcol = 500, --
  display = "msgsep", --change the way text is displayed :: lastline - truncate - uhex - msgsep
  modeline = false, -- lines checked for set commands if is on

  --Colorscheme
  termguicolors = true,
  -- background = "light",

  --indent blankline
  --[[ list = true, ]]
}

--[[ vim.opt.listchars:append "space:⋅" ]]
--[[ vim.opt.listchars:append "eol:↴" ]]

vim.opt.path:append { "**" } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { "*.o", "*~", "*/node_modules/*" }
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

--vim scripts
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
--STOP COMMENTING NEW LINE
vim.cmd "autocmd BufEnter * set formatoptions-=cro"
vim.cmd "autocmd BufEnter * setlocal formatoptions-=cro"

-- Undercurl:Check
--vim.cmd [[let &t_Cs = "\e[4:3m"]]
--vim.cmd [[let &t_Ce = "\e[4:0m"]]

--Things to need to check
--[[ vim.wo.number = true ]]
