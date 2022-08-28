local icons = require "icons"
local cfg = {
  bind = true,
  handler_opts = { border = "single" },
  hint_prefix = icons.misc.Squirrel .. " ",
  floating_window = false,
}
require("lsp_signature").setup(cfg)
