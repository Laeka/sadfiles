-- install packer automatically on new system
-- https://github.com/wbthomason/packer.nvim#bootstrapping
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
packer.startup(function(use)
	-- My plugins here

	--Utils and useful plugins
	use("wbthomason/packer.nvim")
	use("lewis6991/impatient.nvim") --help to improve the startup
	use("rcarriga/nvim-notify") --betters notifications
	use("nvim-lua/plenary.nvim") -- Common utilities
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("christianchiarulli/lua-dev.nvim")
	use("windwp/nvim-autopairs") --close autopairs
	use("kyazdani42/nvim-web-devicons") -- File icons
	use({ "dstein64/vim-startuptime", cmd = "StartupTime", config = [[vim.g.startuptime_tries = 10]] })
	use("mhinz/vim-sayonara") --commands to help with closing the buffer
	use({ "tversteeg/registers.nvim", keys = { { "n", '"' }, { "i", "<c-r>" } } }) --registers popup minimalist
	use("romainl/vim-cool") --desactive highlight search when stop searching
	use("wellle/targets.vim") --manage text objects
	use({
		"AckslD/nvim-neoclip.lua", -- clipboard toggle
		config = function()
			require("neoclip").setup()
		end,
	})
	use("stevearc/dressing.nvim") --pretty ui
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	-- Movement
	use({ "chaoren/vim-wordmotion", "justinmk/vim-sneak" }) -- workmotion: camelcase nav, sneak: find two letters

	-- Indentation tracking
	use({
		"lukas-reineke/indent-blankline.nvim", --lines you see in the right with colors
		config = function()
			require("indent_blankline").setup({
				space_char_blankline = " ",
				buftype_exclude = { "terminal", "help", "telescope" },
				show_current_context = true,
				use_treesitter = true,
				enabled = true,
				-- in theme
				char_highlight_list = {
					"IndentBlanklineIndent1",
					"IndentBlanklineIndent2",
				},
			})
		end,
	})
	-- Wrapping/delimiters
	use({
		{ "machakann/vim-sandwich", event = "User ActuallyEditing" }, -- like surronding
		{ "andymass/vim-matchup", setup = [[require('config.matchup')]], event = "User ActuallyEditing" }, -- %
	})

	--Comments
	use({
		"numToStr/Comment.nvim",
		event = "User ActuallyEditing",
		config = function()
			require("Comment").setup({})
		end,
	})

	-- Undo tree
	use({
		"mbbill/undotree", --nav and view past undos
		cmd = "UndotreeToggle",
		config = [[vim.g.undotree_SetFocusWhenToggle = 1]],
	})

	--themes and colorschemas
	use("wbthomason/vim-nazgul") --theme
	use("gruvbox-community/gruvbox")
	use("folke/tokyonight.nvim")
	use({
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "javascript", "vim", "html" },
		config = [[require('colorizer').setup {'css', 'javascript', 'vim', 'html'}]],
	})
	--cmp plug::autocomplete language
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			"hrsh7th/cmp-nvim-lsp",
			{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-cmp" },
		},
		config = [[require('config.cmp')]],
		event = "InsertEnter",
		after = "LuaSnip",
	})
	use("onsails/lspkind-nvim")

	--snippets
	use({ "L3MON4D3/LuaSnip", event = "InsertEnter" })

	--lsp::language helper
	use({
		"neovim/nvim-lspconfig",
		"ray-x/lsp_signature.nvim",
	})
	use("williamboman/mason.nvim") -- help you to install others lsp servers
	use("williamboman/mason-lspconfig.nvim")
	use("rrethy/vim-illuminate") --illuminate all same words
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } })
	--telescope
	use({
		{
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"telescope-frecency.nvim",
				"telescope-fzf-native.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
				"nvim-telescope/telescope-github.nvim",
				"cljoly/telescope-repo.nvim",
				"nvim-telescope/telescope-file-browser.nvim",
				"LinArcX/telescope-command-palette.nvim",
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
	})

	--treesiter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-refactor", --refactor same words
			"p00f/nvim-ts-rainbow", --parentesis rainbow
			"joosepAlviste/nvim-ts-context-commentstring",
		},
		run = ":TSUpdate",
	})
	--git
	use({
		{
			"lewis6991/gitsigns.nvim", --:CHECK keymaps and conf -git decorations
			requires = { "nvim-lua/plenary.nvim" },
			config = [[require('config.gitsigns')]],
			event = "User ActuallyEditing",
		},
		{ "TimUntersberger/neogit", cmd = "Neogit", config = [[require('config.neogit')]] },
	})

	-- Buffer management
	use({
		"akinsho/bufferline.nvim", --improve buffer management
		requires = "kyazdani42/nvim-web-devicons",
		config = [[require('config.bufferline')]],
		event = "User ActuallyEditing",
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
