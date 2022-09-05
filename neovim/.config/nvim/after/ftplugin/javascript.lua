-- typescript-language-server: 0.11.2
vim.opt_local.linebreak = true
vim.opt_local.colorcolumn = "81"
vim.opt_local.spell = false

-- treesitter Folding
--[[ vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldnestmax = 3
vim.opt_local.foldlevel = 1 ]]

-- LSP buf maps
-- -- go to impl - not all LSPs implement this
--[[ vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "gD",
  "<cmd>lua vim.lsp.buf.implementation()<CR>",
  { noremap = true, silent = true }
) ]]

-- snippets dir- vsnip. Need to try LuaSnip
-- TODO: try to create owns snippets on LuaSnip
vim.b.vsnip_snippet_dir = vim.fn.expand "~/.config/nvim/snippets/javascript/"

-- define LSP signs
--[[ vim.fn.sign_define("DiagnosticSignError", {
  text = "",
  texthl = "DiagnosticSignError",
})

vim.fn.sign_define("DiagnosticSignWarn", {
  text = "",
  texthl = "DiagnosticSignWarn",
})

vim.fn.sign_define("DiagnosticSignHint", {
  text = "",
  texthl = "DiagnosticSignHint",
}) ]]

vim.api.nvim_exec(
  [[
" rainbow color HLs
hi rainbowcol1 guifg=#4B4DA4
hi rainbowcol2 guifg=#C7C84A
hi rainbowcol3 guifg=#8182EB
hi rainbowcol4 guifg=#BCCEA3
hi rainbowcol6 guifg=#1B9C36
]],
  false
)

-- Show diagnostic float on CursorHold
vim.api.nvim_create_augroup("JSLineDiagnostics", {})
vim.api.nvim_create_autocmd(
  "CursorHold",
  { command = "lua vim.diagnostic.open_float(0, {focusable = false, scope = 'line'})", group = "JSLineDiagnostics" }
)

vim.api.nvim_exec(
  [[
match matchDebug /\.debug/

hi matchDebug guifg=Red
]],
  false
)

-- Setup cmp source buffer configuration
--[[ local cmp = require "cmp"
cmp.setup.buffer {
  sources = {
    { name = "nvim_lsp" },
    { name = "treesitter" },
    { name = "vsnip" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function() return vim.api.nvim_list_bufs() end,
      },
    },
    { name = "path" },
  },
}  ]]
