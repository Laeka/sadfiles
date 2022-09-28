local M = {}
function M.notify_current_datetime()
  local dt = vim.fn.strftime "%c"
  require "notify"("Current Date Time: " .. dt, "info", { title = "Date & Time" })
end

-- clear nvim-notify notifications history
function M.clear_notification_history()
  local choice = vim.fn.confirm("Clear Notification History?", "&Yes\n&No\n&Cancel")
  if choice == 1 then
    print "Notification History Cleared"
  else
    print "Notification History Remains"
  end
end

-- toggle boolean word - true/false
-- @TODOUA: Try https://github.com/nguyenvukhang/nvim-toggler/blob/main/lua/nvim-toggler.lua
function M.toggle_bool(args)
  if args.word == "true" then
    vim.cmd [[norm ciwfalse]]
  elseif args.word == "false" then
    vim.cmd [[norm ciwtrue]]
  else
    print "Word under cursor needs to be 'true' or 'false"
  end
end

return M
