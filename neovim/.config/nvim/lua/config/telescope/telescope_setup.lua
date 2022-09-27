local Remap = require "keymap-setup"
local nnoremap = Remap.nnoremap

-- Navigate buffers and repos
nnoremap("<c-p>", [[<cmd>Telescope commands theme=get_dropdown<cr>]])
nnoremap("<c-a>", [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]])
nnoremap("<c-e>", [[<cmd>Telescope frecency theme=get_dropdown<cr>]])
nnoremap("<c-s>", [[<cmd>Telescope git_files theme=get_dropdown<cr>]])
nnoremap("<c-d>", [[<cmd>Telescope find_files theme=get_dropdown<cr>]])
nnoremap("<c-g>", [[<cmd>Telescope live_grep theme=get_dropdown<cr>]])
-- command palette
nnoremap("<space>k", [[<Cmd>:Telescope command_palette<CR>]])

-- telescope notify history
nnoremap(
  "<leader>nh",
  [[<Cmd>lua require('telescope').extensions.notify.notify({results_title='Notification History', prompt_title='Search Messages'})<CR>]]
)

-- show Workspace Diagnostics
nnoremap(",d", [[<Cmd>lua require'telescope.builtin'.diagnostics()<CR>]])

-- neoclip
nnoremap("<C-n>", [[<Cmd>lua require('telescope').extensions.neoclip.default()<CR>]])
