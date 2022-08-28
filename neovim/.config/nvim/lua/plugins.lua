-- install packer automatically on new system
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
  print "Packer is not installed"
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function() return require("packer.util").float { border = "rounded" } end,
  },
}

-- Install your plugins here
packer.startup(function(use)
  -- My plugins here

  --Utils and useful plugins
  use "wbthomason/packer.nvim"
  use "lewis6991/impatient.nvim" --help to improve the startup
  use "rcarriga/nvim-notify" --betters notifications
  use "nvim-lua/plenary.nvim" -- Common utilities
  use "nvim-lualine/lualine.nvim" -- Statusline
  use "christianchiarulli/lua-dev.nvim"
  use "windwp/nvim-autopairs" --close autopairs
  --use "windwp/nvim-ts-autotag"
  use "kyazdani42/nvim-web-devicons" -- File icons
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim" -- open terminal
  use { "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] } --info about the startuptime
  use "mhinz/vim-sayonara" --commands to help with closing the buffer
  use { "tversteeg/registers.nvim", keys = { { "n", '"' }, { "i", "<c-r>" } } } --registers popup minimalist
  use "romainl/vim-cool" --desactive highlight search when stop searching
  use "wellle/targets.vim" --manage text objects
  use "justinmk/vim-dirvish" -- simple path nav
  use "b0o/incline.nvim" --floating statusline for windows

  -- Movement
  use { "chaoren/vim-wordmotion", "justinmk/vim-sneak" } -- workmotion: camelcase nav, sneak: find two letters

  -- Quickfix
  --[[ use { 'Olical/vim-enmasse', cmd = 'EnMasse' } -- check warns and errors for js =need jshint ]]
  use "kevinhwang91/nvim-bqf" --:Check maybe can work with telescope

  -- Indentation tracking
  use {
    "lukas-reineke/indent-blankline.nvim", --lines you see in the right with colors
    config = function()
      require("indent_blankline").setup {
        --[[ space_char_blankline = " ", ]]
        --[[ show_current_context = true, ]]
        --[[ show_current_context_start = true, ]]
      }
    end,
  }
  -- Wrapping/delimiters
  use {
    { "machakann/vim-sandwich", event = "User ActuallyEditing" }, -- like surronding
    { "andymass/vim-matchup", setup = [[require('config.matchup')]], event = "User ActuallyEditing" }, -- %
  }

  --Comments
  use {
    "numToStr/Comment.nvim",
    event = "User ActuallyEditing",
    config = function() require("Comment").setup {} end,
  }

  -- Project Management/Sessions
  use {
    "dhruvasagar/vim-prosession", --:CHECK create and switch between sessios
    after = "vim-obsession",
    requires = { { "tpope/vim-obsession", cmd = "Prosession" } },
    config = [[require('config.prosession')]],
  }

  -- Undo tree
  use {
    "mbbill/undotree", --nav and view past undos
    cmd = "UndotreeToggle",
    config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
  }

  --themes and colorschemas
  use "wbthomason/vim-nazgul" --theme
  --use 'hardselius/warlock'
  --use 'arzg/vim-substrata'
  --use 'sainnhe/gruvbox-material'
  --use 'RRethy/nvim-base16'
  use {
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "javascript", "vim", "html" },
    config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html'}]],
  } --see the colors in code

  --cmp plug::autocomplete language
  use "onsails/lspkind-nvim" -- vscode-like pictograms
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      "hrsh7th/cmp-nvim-lsp",
      { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
      { "hrsh7th/cmp-path", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
      { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
      --'lukas-reineke/cmp-under-comparator',
      { "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
      { "onsails/lspkind-nvim", after = "nvim-cmp" },
    },
    config = [[require('config.cmp')]],
    event = "InsertEnter",
    after = "LuaSnip",
  }

  --snippets
  use { "L3MON4D3/LuaSnip", event = "InsertEnter" } --snippet
  use "rafamadriz/friendly-snippets"

  --lsp::language helper
  use {
    "neovim/nvim-lspconfig",
    { "nvim-lua/lsp-status.nvim", disable = true },
    "folke/trouble.nvim", --:TODO maybe conf, need keymaps -- list of warns errors info
    "ray-x/lsp_signature.nvim",
    --[[ { ]]
    --[[   'kosayoda/nvim-lightbulb', ]]
    --[[   requires = 'antoinemadec/FixCursorHold.nvim', ]]
    --[[ }, ]]
  }
  use "williamboman/mason.nvim" -- help you to install others lsp servers
  use "williamboman/mason-lspconfig.nvim"
  --  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim" --lines show warns error info
  use "rrethy/vim-illuminate" --illuminate all same words
  --use "SmiteshP/nvim-navic" -- show bard like breackcumbs
  --use "lvimuser/lsp-inlayhints.nvim" --lines the same word
  --use "b0o/SchemaStore.nvim" -- schemas for json
  use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } } --formating helper

  --telescope
  use {
    {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "telescope-frecency.nvim",
        "telescope-fzf-native.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
      },
      wants = {
        "popup.nvim",
        "plenary.nvim",
        "telescope-frecency.nvim",
        "telescope-fzf-native.nvim",
      },
      setup = [[require('config.telescope.telescope_setup')]],
      config = [[require('config.telescope.telescope')]],
      cmd = "Telescope",
      module = "telescope",
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      after = "telescope.nvim",
      requires = "kkharji/sqlite.lua",
    },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    },
  }

  --fzf
  --use {
  --"ibhagwan/fzf-lua",
  -- optional for icon support
  --requires = { "kyazdani42/nvim-web-devicons" },
  --}

  --treesiter
  use {
    "nvim-treesitter/nvim-treesitter",
    requires = {
      "nvim-treesitter/nvim-treesitter-refactor", --refactor same words
      "RRethy/nvim-treesitter-textsubjects", --visual mode take subjects
      "p00f/nvim-ts-rainbow", --parentesis rainbow
      "joosepAlviste/nvim-ts-context-commentstring", --treesiter comment
      "RRethy/nvim-treesitter-endwise", --put end
    },
    run = ":TSUpdate",
  }
  --use "nvim-treesitter/nvim-treesitter-textobjects" --:Check
  -- use("RRethy/nvim-treesitter-textsubjects")
  --use "nvim-treesitter/nvim-treesitter-context" --treesiter context languages
  --use "drybalka/tree-climber.nvim" --tree siter navigation easy

  --git
  use {
    {
      "lewis6991/gitsigns.nvim", --:CHECK keymaps and conf -git decorations
      requires = { "nvim-lua/plenary.nvim" },
      config = [[require('config.gitsigns')]],
      event = "User ActuallyEditing",
    },
    { "TimUntersberger/neogit", cmd = "Neogit", config = [[require('config.neogit')]] }, --:Check keymaps and conf - git terminal
  }

  -- Buffer management
  use {
    "akinsho/bufferline.nvim", --improve buffer management
    requires = "kyazdani42/nvim-web-devicons",
    config = [[require('config.bufferline')]],
    event = "User ActuallyEditing",
  }

  -- Debugger
  --use {
  --{
  --'mfussenegger/nvim-dap',
  -- setup = [[require('config.dap_setup')]],
  -- config = [[require('config.dap')]],
  -- requires = 'jbyuki/one-small-step-for-vimkind',
  -- wants = 'one-small-step-for-vimkind',
  -- cmd = { 'BreakpointToggle', 'Debug', 'DapREPL' },
  -- },
  -- {
  --  'rcarriga/nvim-dap-ui',
  --  requires = 'nvim-dap',
  -- wants = 'nvim-dap',
  --  after = 'nvim-dap',
  --  config = function()
  --    require('dapui').setup()
  --  end,
  -- },
  -- }

  -- REPLs
  --[[ use { ]]
  --[[   "hkupty/iron.nvim",  --real time terminal to auto execute code ]]
  --   setup = [[vim.g.iron_map_defaults = 0]],
  --   config = [[require('config.iron')]],
  --[[   cmd = { "IronRepl", "IronSend", "IronReplHere" }, ]]
  --[[ } ]]

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
