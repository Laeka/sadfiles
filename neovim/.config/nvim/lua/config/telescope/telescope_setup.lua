-- TODO: crear search para check, fix, hack, note, warning
-- FIX: comandos de la parte de abajo
-- NOTE: probar los comandos git en una carpeta con git iniciado
local map = vim.api.nvim_set_keymap
local silent = { silent = true, noremap = true }
-- Navigate buffers and repos
--map("n", "<c-p>", [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map("n", "<c-p>", [[<cmd>Telescope commands theme=get_dropdown<cr>]], silent)
map("n", "<c-a>", [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], silent)
map("n", "<c-e>", [[<cmd>Telescope frecency theme=get_dropdown<cr>]], silent)
map("n", "<c-s>", [[<cmd>Telescope git_files theme=get_dropdown<cr>]], silent)
map("n", "<c-d>", [[<cmd>Telescope find_files theme=get_dropdown<cr>]], silent)
map("n", "<c-g>", [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], silent)
-- command palette
map("n", "<space>k", [[<Cmd>:Telescope command_palette<CR>]], silent)

-- Search through your Neovim related todos
map("n", "<leader>st", ":lua require'config.telescope.telescope'.search_todos()<CR>", silent)

-- search Brave bookmarks & go
map("n", "<space>b", [[<Cmd>lua require('telescope').extensions.bookmarks.bookmarks()<CR>]], silent)

-- telescope-repo
map("n", "<leader>rl", [[<Cmd>lua require'.telescope'.repo_list()<CR>]], silent)

-- telescope notify history
map(
  "n",
  "<leader>nh",
  [[<Cmd>lua require('telescope').extensions.notify.notify({results_title='Notification History', prompt_title='Search Messages'})<CR>]],
  silent
)

-- Telescope resume (last picker)
map("n", "<leader>tr", [[<Cmd>lua require'telescope.builtin'.resume()<CR>]], silent)

-- git telescope goodness
-- git_branches
map(
  "n",
  ";gb",
  [[<Cmd>lua require'telescope.builtin'.git_branches({prompt_title = ' ', results_title='Git Branches'})<CR>]],
  {
    noremap = true,
    silent = true,
  }
)

-- git_bcommits - file scoped commits with diff preview. <C-V> for vsp diff to parent
map(
  "n",
  "<space>gc",
  [[<Cmd>lua require'telescope.builtin'.git_bcommits({prompt_title = '  ', results_title='Git File Commits'})<CR>]],
  silent
)

-- git_commits (log) git log
map("n", "gl", [[<Cmd>lua require'telescope.builtin'.git_commits()<CR>]], silent)
-- git_status - <tab> to toggle staging
map("n", "gs", [[<Cmd>lua require'telescope.builtin'.git_status()<CR>]], silent)

-- registers picker
map("n", "<space>r", [[<Cmd>lua require'telescope.builtin'.registers()<CR>]], silent)

-- show Workspace Diagnostics
map("n", ",d", [[<Cmd>lua require'telescope.builtin'.diagnostics()<CR>]], silent)

map("n", ",k", [[<Cmd>lua require'telescope.builtin'.keymaps({results_title='Key Maps Results'})<CR>]], silent)

map("n", ",h", [[<Cmd>lua require'telescope.builtin'.help_tags({results_title='Help Results'})<CR>]], silent)

-- find files with gitfiles & fallback on find_files
map("n", ",<space>", [[<Cmd>lua require'.telescope'.project_files()<CR>]], silent)
-- browse, explore and create notes
map("n", ",n", [[<Cmd>lua require'.telescope'.browse_notes()<CR>]], silent)
-- Explore files starting at $HOME
map("n", ",e", [[<Cmd>lua require'.telescope'.file_explorer()<CR>]], silent)
-- Browse files from cwd - File Browser
map("n", ",fb", [[<Cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>]], silent)

-- find notes
map("n", "<leader>n", [[<Cmd>lua require'.telescope'.find_notes()<CR>]], silent)
-- search notes
map("n", "<space>n", [[<Cmd>lua require'.telescope'.grep_notes()<CR>]], silent)
-- Find files in config dirs
map("n", "<space>e", [[<Cmd>lua require'.telescope'.find_configs()<CR>]], silent)
-- greg for a string
map("n", "<space>g", [[<Cmd>lua require'.telescope'.grep_prompt()<CR>]], silent)
-- find or create neovim configs
map("n", "<leader>nc", [[<Cmd>lua require'.telescope'.nvim_config()<CR>]], silent)

-- Github issues
map("n", "<leader>is", [[<Cmd>lua require'.telescope'.gh_issues()<CR>]], silent)
-- github Pull Requests - PRs
map("n", "<leader>pr", [[<Cmd>lua require'.telescope'.gh_prs()<CR>]], silent)

-- neoclip
map("n", "<C-n>", [[<Cmd>lua require('telescope').extensions.neoclip.default()<CR>]], silent)
