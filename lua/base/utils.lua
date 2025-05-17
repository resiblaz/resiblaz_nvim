local M = {}

-- check OS
function M.get_os()
  local os
  if vim.fn.has "mac" == 1 then
    os = "mac"
  elseif vim.fn.has "unix" == 1 then
    os = "linux"
  elseif vim.fn.has "win32" == 1 then
    os = "win"
  else
    require("astronvim.utils").notify("not valid os", vim.log.levels.ERROR)
  end
  return os
end

function M.is_mac()
  if M.get_os() == "mac" then
    return true
  else
    return false
  end
end

function M.is_win()
  if M.get_os() == "win" then
    return true
  else
    return false
  end
end

-- buffer utils
function M.is_buffer_change()
    local current = vim.api.nvim_get_current_buf()
    if vim.api.nvim_get_option_value("modified", {buf = current}) then
      return true
    else
      return false
    end
  end

function M.nav(n)
  local current = vim.api.nvim_get_current_buf()
  for i, v in ipairs(vim.t.bufs) do
    if current == v then
      vim.cmd.b(vim.t.bufs[(i+n-1) % #vim.t.bufs + 1])
      break
    end
  end
end

return M
