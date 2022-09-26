require("notify").setup {
  timeout = 5000,
  stages = "fade",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
  background_colour = "#000000",
}

local log = require("plenary.log").new {
  plugin = "notify",
  level = "debug",
  use_console = false,
}

vim.notify = function(msg, level, opts)
  log.info(msg, level, opts)

  require "notify"(msg, level, opts)
end
