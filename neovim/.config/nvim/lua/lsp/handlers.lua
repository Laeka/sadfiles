M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then return end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

M.setup = function()
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  local config = {
    --disable virtual text
    virtual_lines = false,
    virtual_text = false,
    --show signs
    signs = { active = signs },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "if_many", --or always
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  local border_style = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
  }

  local pop_opts = { border = border_style }
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
end

local function lsp_highlight_document(client)
  -- if client.server_capabilities.document_highlight then
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then return end
  illuminate.on_attach(client)
  -- end
end

local buf_keymap = vim.api.nvim_buf_set_keymap
local keymap_opts = { noremap = true, silent = true }

local function lsp_keymaps(bufnr)
  buf_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", keymap_opts)
  buf_keymap(bufnr, "n", "gd", '<cmd>lua require"telescope.builtin".lsp_definitions()<CR>', keymap_opts)
  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap_opts)
  buf_keymap(bufnr, "n", "gi", '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', keymap_opts)
  buf_keymap(bufnr, "n", "gS", "<cmd>lua vim.lsp.buf.signature_help()<CR>", keymap_opts)
  buf_keymap(bufnr, "n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", keymap_opts)
  buf_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", keymap_opts)
  buf_keymap(bufnr, "n", "gr", '<cmd>lua require"telescope.builtin".lsp_references()<CR>', keymap_opts)
  buf_keymap(bufnr, "n", "gA", "<cmd>lua vim.lsp.buf.code_action()<CR>", keymap_opts)
  buf_keymap(bufnr, "v", "gA", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", keymap_opts)
  buf_keymap(bufnr, "n", "]e", '<cmd>lua vim.diagnostic.goto_next { float = {scope = "line"} }<cr>', keymap_opts)
  buf_keymap(bufnr, "n", "[e", '<cmd>lua vim.diagnostic.goto_prev { float = {scope = "line"} }<cr>', keymap_opts)
  buf_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting() <cr>", keymap_opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then client.resolved_capabilities.document_formatting = false end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
  --if client.name == "tsserver" then require("lsp-inlayhints").on_attach(bufnr, client) end
end

return M
