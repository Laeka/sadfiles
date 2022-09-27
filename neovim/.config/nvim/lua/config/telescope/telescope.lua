local telescope = require "telescope"
require "config.telescope.telescope_setup"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local utils = require "telescope.utils"

-- https://github.com/nvim-telescope/telescope.nvim/issues/1048
local telescope_custom_actions = {}

function telescope_custom_actions._multiopen(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if not num_selections or num_selections <= 1 then actions.add_selection(prompt_bufnr) end
  actions.send_selected_to_qflist(prompt_bufnr)
  vim.cmd("cfdo " .. open_cmd)
end

function telescope_custom_actions.multi_selection_open(prompt_bufnr)
  telescope_custom_actions._multiopen(prompt_bufnr, "edit")
end

telescope.setup {
  defaults = {
    preview = {
      timeout = 500,
      msg_bg_fillchar = "",
    },
    multi_icon = " ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    color_devicons = true,
    layout_config = {
      prompt_position = "bottom",
      horizontal = {
        width_padding = 0.04,
        height_padding = 0.1,
        preview_width = 0.6,
      },
      vertical = {
        width_padding = 0.05,
        height_padding = 1,
        preview_height = 0.5,
      },
    },
    -- using custom temp multi-select maps
    -- https://github.com/nvim-telescope/telescope.nvim/issues/1048
    mappings = {
      n = {
        ["<Del>"] = actions.close,
        ["<C-A>"] = telescope_custom_actions.multi_selection_open,
      },
      i = {
        ["<esc>"] = actions.close,
        ["<C-A>"] = telescope_custom_actions.multi_selection_open,
      },
    },
    dynamic_preview_title = true,
    winblend = 4,
    file_ignore_patterns = { "node_modules", ".git", ".dynamodb" },
  },
  extensions = {
    frecency = { workspaces = { exo = "/home/laekagg/PROG/" } },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
    command_palette = {
      {
        "File",
        { "File Browser", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
        { "Search for Word", ":lua require('telescope.builtin').live_grep()", 1 },
        {"File explorer", "lua require'config.telescope.telescope'.file_explorer()"},
        {"Resume(last picker)","lua require'telescope.builtin'.resume()"},
        {"Grep string", "lua require'config.telescope.telescope'.grep_prompt()"},
      },
      {
        "Folder",
        {"Repo list", "lua require'config.telescope.telescope'.repo_list()"},
        { "Project Files", ":lua require'config.telescope.telescope'.project_files()", 1 },
        {"Find configs", "lua require'config.telescope.telescope'.find_configs()"},
        {"Find/create nvim configs", "lua require'config.telescope.telescope'.nvim_config()"},
      }
      {
        "Git(Hub)",
        { " Issues", "lua require'config.telescope.telescope'.gh_issues()", 1 },
        { " Pulls", "lua require'config.telescope.telescope'.gh_prs()", 1 },
        { " Status", "lua require'telescope.builtin'.git_status()", 1 },
        { " Diff Split Vertical", ":Gvdiffsplit!", 1 },
        { " Git commits", "lua require'telescope.builtin'.git_commits()", 1 },
        {
          " File commits",
          ":lua require'telescope.builtin'.git_bcommits({prompt_title = '  ', results_title='Git File Commits'})",
          1,
        },
      },
      {
        "Notes",
        { "Browse Notes", "lua require'config.telescope.telescope'.browse_notes()", 1 },
        { "Find Notes", "lua require'config.telescope.telescope'.find_notes()", 1 },
        { "Search/Grep Notes", "lua require'config.telescope.telescope'.grep_notes()", 1 },
      },
      {
        "TODO",
        {"Search TODOS", ":lua require'config.telescope.telescope'.search_todos()"},
      },
      {
        "Telescope",
        { "commands", ":lua require('telescope.builtin').commands()" },
        { "command history", ":lua require('telescope.builtin').command_history()" },
        { "registers", ":lua require('telescope.builtin').registers()" },
        { "options", ":lua require('telescope.builtin').vim_options()" },
        { "keymaps", ":lua require('telescope.builtin').keymaps()" },
        {"help tags", "lua require'telescope.builtin'.help_tags({results_title='Help Results'})"},
        { "buffers", ":Telescope buffers" },
        { "search history", ":lua require('telescope.builtin').search_history()" },
      },
    },
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = false,
    },
  },
}

-- Extensions
telescope.load_extension "frecency"
telescope.load_extension "fzf"
telescope.load_extension "ui-select"
telescope.load_extension "notify"
telescope.load_extension "file_browser"
telescope.load_extension "command_palette"
telescope.load_extension "repo"
telescope.load_extension "neoclip"
telescope.load_extension "gh"

-- requires repo extension
function M.repo_list()
  local opts = {}
  opts.prompt_title = " Repos"
  require("telescope").extensions.repo.list(opts)
end

-- requires GitHub extension
function M.gh_issues()
  local opts = {}
  opts.prompt_title = " Issues"
  require("telescope").extensions.gh.issues(opts)
end

function M.gh_prs()
  local opts = {}
  opts.prompt_title = " Pull Requests"
  require("telescope").extensions.gh.pull_request(opts)
end
-- end github functions

-- grep_string pre-filtered from grep_prompt
local function grep_filtered(opts)
  opts = opts or {}
  require("telescope.builtin").grep_string {
    path_display = { "smart" },
    search = opts.filter_word or "",
  }
end

-- open vim.ui.input dressing prompt for initial filter
function M.grep_prompt()
  vim.ui.input({ prompt = "Rg " }, function(input) grep_filtered { filter_word = input } end)
end

-- search Neovim related todos
function M.search_todos()
  require("telescope.builtin").grep_string {
    prompt_title = " Search TODO",
    prompt_prefix = " ",
    results_title = "Neovim TODO",
    path_display = { "smart" },
    search = "TODO: ",
  }
end

M.project_files = function()
  local _, ret, stderr = utils.get_os_command_output {
    "git",
    "rev-parse",
    "--is-inside-work-tree",
  }

  local gopts = {}
  local fopts = {}

  gopts.prompt_title = " Find"
  gopts.prompt_prefix = "  "
  gopts.results_title = " Repo Files"

  fopts.hidden = true
  fopts.file_ignore_patterns = {
    ".vim/",
    ".local/",
    ".cache/",
    "Downloads/",
    ".git/",
    "Dropbox/.*",
    "Library/.*",
    "node%_modules/.*",
    ".dynamodb",
  }

  if ret == 0 then
    require("telescope.builtin").git_files(gopts)
  else
    fopts.results_title = "CWD: " .. vim.fn.getcwd()
    require("telescope.builtin").find_files(fopts)
  end
end

-- @TODOUA: break up notes and configs
function M.grep_notes()
  local opts = {}
  opts.hidden = true
  opts.search_dirs = {
    "~/notes/",
  }
  opts.prompt_prefix = "   "
  opts.prompt_title = " Grep Notes"
  opts.path_display = { "smart" }
  require("telescope.builtin").live_grep(opts)
end

function M.find_notes()
  require("telescope.builtin").find_files {
    prompt_title = " Find Notes",
    path_display = { "smart" },
    cwd = "~/notes/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.browse_notes()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " Browse Notes",
    prompt_prefix = " ﮷ ",
    cwd = "~/notes/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.find_configs()
  require("telescope.builtin").find_files {
    prompt_title = " NVim & Term Config Find",
    results_title = "Config Files Results",
    path_display = { "smart" },
    search_dirs = {
      "~/.config/nvim/",
      "~/.config/kitty/",
      "~/.config/neofetch/",
    },
    -- cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.nvim_config()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " NVim Config Browse",
    cwd = "~/.config/nvim/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

function M.file_explorer()
  require("telescope").extensions.file_browser.file_browser {
    prompt_title = " File Browser",
    path_display = { "smart" },
    cwd = "~/",
    layout_strategy = "horizontal",
    layout_config = { preview_width = 0.65, width = 0.75 },
  }
end

return M
