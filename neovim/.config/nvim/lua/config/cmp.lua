local types = require "cmp.types"
local str = require "cmp.utils.str"

-- completion maps (not cmp) --
-- line completion - use more!
-- inoremap <C-l> <C-x><C-l>
vim.api.nvim_set_keymap("i", "<c-l>", "<c-x><c-l>", { noremap = true })
-- Vim command-line completion
-- inoremap <C-v> <C-x><C-v>
vim.api.nvim_set_keymap("i", "<c-v>", "<c-x><c-v>", { noremap = true })
-- end non-cmp completion maps --

local status, cmp = pcall(require, "cmp")
if not status then return end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then return end

local kind_status_ok, lspkind = pcall(require, "lspkind")
if not kind_status_ok then return end

require("luasnip/loaders/from_vscode").lazy_load()

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

cmp.setup {
  completion = { completeopt = "menu,menuone,noinsert" },
  sorting = {
    comparators = {
      -- The built-in comparators:
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      --require('cmp-under-comparator').under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  mapping = {
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format {
      mode = "symbol",
      maxwidth = 50,
      --the function below will be called before any modifications from lspkind
      before = function(entry, vim_item)
        vim_item.menu = ({
          nvim_sig = "[SIG]",
          luasnip = "[Lsnippet]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          buffer = "[Buffer]",
        })[entry.source.name]

        -- Get the full snippet (and only keep first line)
        local word = entry:get_insert_text()
        if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
          word = vim.lsp.util.parse_snippet(word)
        end
        word = str.oneline(word)
        if
          entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
          and string.sub(vim_item.abbr, -1, -1) == "~"
        then
          word = word .. "~"
        end
        vim_item.abbr = word

        return vim_item
      end,
    },
  },
  sources = cmp.config.sources {
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function() return vim.api.nvim_list_bufs() end,
      },
      { name = "spell" },
    },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}
