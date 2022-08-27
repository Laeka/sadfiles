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
  use "windwp/nvim-autopairs"
  --use "windwp/nvim-ts-autotag"
  use "kyazdani42/nvim-web-devicons" -- File icons
  use "kyazdani42/nvim-tree.lua" --folders files show like vscode
  use "akinsho/bufferline.nvim" --better way to manage buffers
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim" -- open terminal
  use "dstein64/vim-startuptime" --info about the startuptime
  use "mhinz/vim-sayonara" --commands to help with closing the buffer
  use { "tversteeg/registers.nvim", keys = { { "n", '"' }, { "i", "<c-r>" } } } --registers popup minimalist
  use "romainl/vim-cool" --desactive highlight search when stop searching
  use "wellle/targets.vim" --manage text objects

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
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  }
  -- Wrapping/delimiters
  use {
    { "machakann/vim-sandwich", event = "User ActuallyEditing" }, -- like surronding
    { "andymass/vim-matchup", setup = [[require('config.matchup')]], event = "User ActuallyEditing" }, -- %
  }

  use {
    "numToStr/Comment.nvim",
    event = "User ActuallyEditing",
    config = function() require("Comment").setup {} end,
  }

  --themes and colorschemas
  use {
    "svrana/neosolarized.nvim", --theme
    requires = { "tjdevries/colorbuddy.nvim" },
  }
  use "norcalli/nvim-colorizer.lua"

  --cmp plug::autocomplete language
  use "hrsh7th/nvim-cmp" -- Completion
  use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
  use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lua"
  use "saadparwaiz1/cmp_luasnip"
  --use "hrsh7th/cmp-cmdline"
  use "onsails/lspkind-nvim" -- vscode-like pictograms

  --snippets
  use "l3MON4D3/LuaSnip" --snippet
  use "rafamadriz/friendly-snippets"

  --lsp::language helper
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim" -- help you to install others lsp servers
  use "williamboman/mason-lspconfig.nvim"
  --  use "glepnir/lspsaga.nvim" -- LSP UIs
  use "https://git.sr.ht/~whynothugo/lsp_lines.nvim" --lines show warns error info
  use "rrethy/vim-illuminate" --illuminate all same words
  --use "SmiteshP/nvim-navic" -- show bard like breackcumbs
  --use "lvimuser/lsp-inlayhints.nvim" --lines the same word
  use "b0o/SchemaStore.nvim" -- schemas for json
  use "ray-x/lsp_signature.nvim" --signature to complete the code
  use "jose-elias-alvarez/null-ls.nvim" --formating helper

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
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow" --parentesis rainbow
  use "joosepAlviste/nvim-ts-context-commentstring" --treesiter comment
  --use "nvim-treesitter/nvim-treesitter-textobjects" --:Check
  -- use("RRethy/nvim-treesitter-textsubjects")
  --use "nvim-treesitter/nvim-treesitter-context" --treesiter context languages
  --use "drybalka/tree-climber.nvim" --tree siter navigation easy

  --git
  use "dinhhuy258/git.nvim" -- For git blame & browse
  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then require("packer").sync() end
end)
