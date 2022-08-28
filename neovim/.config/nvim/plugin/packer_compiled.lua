-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function("has", { "nvim-0.5" }) ~= 1 then
  vim.api.nvim_command 'echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"'
  return
end

vim.api.nvim_command "packadd packer.nvim"

local no_errors, error_msg = pcall(function()
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end

  local function save_profiles(threshold)
    local sorted_times = {}
    for chunk_name, time_taken in pairs(profile_info) do
      sorted_times[#sorted_times + 1] = { chunk_name, time_taken }
    end
    table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
    local results = {}
    for i, elem in ipairs(sorted_times) do
      if not threshold or threshold and elem[2] > threshold then results[i] = elem[1] .. " took " .. elem[2] .. "ms" end
    end

    _G._packer = _G._packer or {}
    _G._packer.profile_output = results
  end

  time([[Luarocks path setup]], true)
  local package_path_str =
    "/home/laekagg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/laekagg/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/laekagg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/laekagg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
  local install_cpath_pattern = "/home/laekagg/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
  if not string.find(package.path, package_path_str, 1, true) then
    package.path = package.path .. ";" .. package_path_str
  end

  if not string.find(package.cpath, install_cpath_pattern, 1, true) then
    package.cpath = package.cpath .. ";" .. install_cpath_pattern
  end

  time([[Luarocks path setup]], false)
  time([[try_loadstring definition]], true)
  local function try_loadstring(s, component, name)
    local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
    if not success then
      vim.schedule(
        function()
          vim.api.nvim_notify(
            "packer.nvim: Error running " .. component .. " for " .. name .. ": " .. result,
            vim.log.levels.ERROR,
            {}
          )
        end
      )
    end
    return result
  end

  time([[try_loadstring definition]], false)
  time([[Defining packer_plugins]], true)
  _G.packer_plugins = {
    ["Comment.nvim"] = {
      config = {
        "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0",
      },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
      url = "https://github.com/numToStr/Comment.nvim",
    },
    LuaSnip = {
      after = { "nvim-cmp" },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/LuaSnip",
      url = "https://github.com/L3MON4D3/LuaSnip",
    },
    ["bufferline.nvim"] = {
      config = { "require('config.bufferline')" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
      url = "https://github.com/akinsho/bufferline.nvim",
    },
    ["cmp-buffer"] = {
      after_files = { "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
      load_after = {
        ["nvim-cmp"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
      url = "https://github.com/hrsh7th/cmp-buffer",
    },
    ["cmp-nvim-lsp"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp",
    },
    ["cmp-nvim-lsp-document-symbol"] = {
      after_files = {
        "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol/after/plugin/cmp_nvim_lsp_document_symbol.lua",
      },
      load_after = {
        ["nvim-cmp"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol",
    },
    ["cmp-nvim-lsp-signature-help"] = {
      after_files = {
        "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua",
      },
      load_after = {
        ["nvim-cmp"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
      url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help",
    },
    ["cmp-nvim-lua"] = {
      after_files = {
        "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua",
      },
      load_after = {
        ["nvim-cmp"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
      url = "https://github.com/hrsh7th/cmp-nvim-lua",
    },
    ["cmp-path"] = {
      after_files = { "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
      load_after = {
        ["nvim-cmp"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp-path",
      url = "https://github.com/hrsh7th/cmp-path",
    },
    cmp_luasnip = {
      after_files = {
        "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua",
      },
      load_after = {
        ["nvim-cmp"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
      url = "https://github.com/saadparwaiz1/cmp_luasnip",
    },
    ["friendly-snippets"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/friendly-snippets",
      url = "https://github.com/rafamadriz/friendly-snippets",
    },
    ["gitsigns.nvim"] = {
      config = { "require('config.gitsigns')" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
      url = "https://github.com/lewis6991/gitsigns.nvim",
    },
    ["impatient.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/impatient.nvim",
      url = "https://github.com/lewis6991/impatient.nvim",
    },
    ["incline.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/incline.nvim",
      url = "https://github.com/b0o/incline.nvim",
    },
    ["indent-blankline.nvim"] = {
      config = {
        "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21indent_blankline\frequire\0",
      },
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
      url = "https://github.com/lukas-reineke/indent-blankline.nvim",
    },
    ["lsp_lines.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    },
    ["lsp_signature.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
      url = "https://github.com/ray-x/lsp_signature.nvim",
    },
    ["lspkind-nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
      url = "https://github.com/onsails/lspkind-nvim",
    },
    ["lua-dev.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
      url = "https://github.com/christianchiarulli/lua-dev.nvim",
    },
    ["lualine.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/lualine.nvim",
      url = "https://github.com/nvim-lualine/lualine.nvim",
    },
    ["mason-lspconfig.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
      url = "https://github.com/williamboman/mason-lspconfig.nvim",
    },
    ["mason.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/mason.nvim",
      url = "https://github.com/williamboman/mason.nvim",
    },
    neogit = {
      commands = { "Neogit" },
      config = { "require('config.neogit')" },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/neogit",
      url = "https://github.com/TimUntersberger/neogit",
    },
    ["null-ls.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
      url = "https://github.com/jose-elias-alvarez/null-ls.nvim",
    },
    ["nvim-autopairs"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
      url = "https://github.com/windwp/nvim-autopairs",
    },
    ["nvim-bqf"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-bqf",
      url = "https://github.com/kevinhwang91/nvim-bqf",
    },
    ["nvim-cmp"] = {
      after = {
        "cmp-nvim-lua",
        "cmp-buffer",
        "cmp-path",
        "cmp_luasnip",
        "cmp-nvim-lsp-signature-help",
        "cmp-nvim-lsp-document-symbol",
      },
      config = { "require('config.cmp')" },
      load_after = {
        LuaSnip = true,
      },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
      url = "https://github.com/hrsh7th/nvim-cmp",
    },
    ["nvim-colorizer.lua"] = {
      config = { "require('colorizer').setup {'css', 'javascript', 'vim', 'html'}" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
      url = "https://github.com/norcalli/nvim-colorizer.lua",
    },
    ["nvim-lspconfig"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
      url = "https://github.com/neovim/nvim-lspconfig",
    },
    ["nvim-notify"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-notify",
      url = "https://github.com/rcarriga/nvim-notify",
    },
    ["nvim-treesitter"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
      url = "https://github.com/nvim-treesitter/nvim-treesitter",
    },
    ["nvim-treesitter-endwise"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-treesitter-endwise",
      url = "https://github.com/RRethy/nvim-treesitter-endwise",
    },
    ["nvim-treesitter-refactor"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
      url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor",
    },
    ["nvim-treesitter-textsubjects"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
      url = "https://github.com/RRethy/nvim-treesitter-textsubjects",
    },
    ["nvim-ts-context-commentstring"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
      url = "https://github.com/joosepAlviste/nvim-ts-context-commentstring",
    },
    ["nvim-ts-rainbow"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
      url = "https://github.com/p00f/nvim-ts-rainbow",
    },
    ["nvim-web-devicons"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
      url = "https://github.com/kyazdani42/nvim-web-devicons",
    },
    ["packer.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/packer.nvim",
      url = "https://github.com/wbthomason/packer.nvim",
    },
    ["plenary.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/plenary.nvim",
      url = "https://github.com/nvim-lua/plenary.nvim",
    },
    ["popup.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/popup.nvim",
      url = "https://github.com/nvim-lua/popup.nvim",
    },
    ["registers.nvim"] = {
      keys = { { "n", '"' }, { "i", "<c-r>" } },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/registers.nvim",
      url = "https://github.com/tversteeg/registers.nvim",
    },
    ["sqlite.lua"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/sqlite.lua",
      url = "https://github.com/kkharji/sqlite.lua",
    },
    ["targets.vim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/targets.vim",
      url = "https://github.com/wellle/targets.vim",
    },
    ["telescope-frecency.nvim"] = {
      load_after = {
        ["telescope.nvim"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
      url = "https://github.com/nvim-telescope/telescope-frecency.nvim",
    },
    ["telescope-fzf-native.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
      url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    },
    ["telescope-ui-select.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
      url = "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    },
    ["telescope.nvim"] = {
      after = { "telescope-frecency.nvim" },
      commands = { "Telescope" },
      config = { "require('config.telescope.telescope')" },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
      url = "https://github.com/nvim-telescope/telescope.nvim",
      wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim" },
    },
    ["toggleterm.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
      url = "https://github.com/akinsho/toggleterm.nvim",
    },
    ["trouble.nvim"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/trouble.nvim",
      url = "https://github.com/folke/trouble.nvim",
    },
    undotree = {
      commands = { "UndotreeToggle" },
      config = { "vim.g.undotree_SetFocusWhenToggle = 1" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/undotree",
      url = "https://github.com/mbbill/undotree",
    },
    ["vim-bbye"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-bbye",
      url = "https://github.com/moll/vim-bbye",
    },
    ["vim-cool"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-cool",
      url = "https://github.com/romainl/vim-cool",
    },
    ["vim-dirvish"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-dirvish",
      url = "https://github.com/justinmk/vim-dirvish",
    },
    ["vim-illuminate"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-illuminate",
      url = "https://github.com/rrethy/vim-illuminate",
    },
    ["vim-matchup"] = {
      after_files = { "/home/laekagg/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/vim-matchup",
      url = "https://github.com/andymass/vim-matchup",
    },
    ["vim-nazgul"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-nazgul",
      url = "https://github.com/wbthomason/vim-nazgul",
    },
    ["vim-obsession"] = {
      after = { "vim-prosession" },
      commands = { "Prosession" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/vim-obsession",
      url = "https://github.com/tpope/vim-obsession",
    },
    ["vim-prosession"] = {
      config = { "require('config.prosession')" },
      load_after = {
        ["vim-obsession"] = true,
      },
      loaded = false,
      needs_bufread = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/vim-prosession",
      url = "https://github.com/dhruvasagar/vim-prosession",
    },
    ["vim-sandwich"] = {
      loaded = false,
      needs_bufread = true,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/vim-sandwich",
      url = "https://github.com/machakann/vim-sandwich",
    },
    ["vim-sayonara"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-sayonara",
      url = "https://github.com/mhinz/vim-sayonara",
    },
    ["vim-sneak"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-sneak",
      url = "https://github.com/justinmk/vim-sneak",
    },
    ["vim-startuptime"] = {
      commands = { "StartupTime" },
      config = { "vim.g.startuptime_tries = 10" },
      loaded = false,
      needs_bufread = false,
      only_cond = false,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
      url = "https://github.com/dstein64/vim-startuptime",
    },
    ["vim-wordmotion"] = {
      loaded = true,
      path = "/home/laekagg/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
      url = "https://github.com/chaoren/vim-wordmotion",
    },
  }

  time([[Defining packer_plugins]], false)
  local module_lazy_loads = {
    ["^telescope"] = "telescope.nvim",
  }
  local lazy_load_called = { ["packer.load"] = true }
  local function lazy_load_module(module_name)
    local to_load = {}
    if lazy_load_called[module_name] then return nil end
    lazy_load_called[module_name] = true
    for module_pat, plugin_name in pairs(module_lazy_loads) do
      if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
        to_load[#to_load + 1] = plugin_name
      end
    end

    if #to_load > 0 then
      require "packer.load"(to_load, { module = module_name }, _G.packer_plugins)
      local loaded_mod = package.loaded[module_name]
      if loaded_mod then return function(modname) return loaded_mod end end
    end
  end

  if not vim.g.packer_custom_loader_enabled then
    table.insert(package.loaders, 1, lazy_load_module)
    vim.g.packer_custom_loader_enabled = true
  end

  -- Setup for: vim-matchup
  time([[Setup for vim-matchup]], true)
  require "config.matchup"
  time([[Setup for vim-matchup]], false)
  -- Setup for: telescope.nvim
  time([[Setup for telescope.nvim]], true)
  require "config.telescope.telescope_setup"
  time([[Setup for telescope.nvim]], false)
  -- Config for: indent-blankline.nvim
  time([[Config for indent-blankline.nvim]], true)
  try_loadstring(
    "\27LJ\2\nB\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\21indent_blankline\frequire\0",
    "config",
    "indent-blankline.nvim"
  )
  time([[Config for indent-blankline.nvim]], false)

  -- Command lazy-loads
  time([[Defining lazy-load commands]], true)
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Prosession lua require("packer.load")({'vim-obsession'}, { cmd = "Prosession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  pcall(
    vim.cmd,
    [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]]
  )
  time([[Defining lazy-load commands]], false)

  -- Keymap lazy-loads
  time([[Defining lazy-load keymaps]], true)
  vim.cmd [[inoremap <silent> <c-r> <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "<lt>c-r>" }, _G.packer_plugins)<cr>]]
  vim.cmd [[nnoremap <silent> " <cmd>lua require("packer.load")({'registers.nvim'}, { keys = "\"", prefix = "" }, _G.packer_plugins)<cr>]]
  time([[Defining lazy-load keymaps]], false)

  vim.cmd [[augroup packer_load_aucmds]]
  vim.cmd [[au!]]
  -- Filetype lazy-loads
  time([[Defining lazy-load filetype autocommands]], true)
  vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
  vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
  vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
  vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
  time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
  time([[Defining lazy-load event autocommands]], true)
  vim.cmd [[au User ActuallyEditing ++once lua require("packer.load")({'vim-matchup', 'Comment.nvim', 'gitsigns.nvim', 'vim-sandwich', 'bufferline.nvim'}, { event = "User ActuallyEditing" }, _G.packer_plugins)]]
  vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'LuaSnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
  time([[Defining lazy-load event autocommands]], false)
  vim.cmd "augroup END"
  if should_profile then save_profiles() end
end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command(
    'echohl ErrorMsg | echom "Error in packer_compiled: '
      .. error_msg
      .. '" | echom "Please check your config for correctness" | echohl None'
  )
end
