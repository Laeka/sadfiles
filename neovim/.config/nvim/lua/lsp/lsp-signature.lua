local icons = require "icons"
local cfg = {
  bind = true,
  doc_lines = 2,
  hint_enablle = true,
  hint_scheme = "String",
  use_lspsaga = false,
  hi_parameter = "PmenuSel",
  max_height = 12,
  max_width = 120,
  extra_trigger_chars = {},
  handler_opts = { border = "single" },
  hint_prefix = icons.misc.Squirrel .. " ",
  floating_window = false,
}
require("lsp_signature").setup(cfg)
