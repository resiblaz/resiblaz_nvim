local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local utils_u = require("user.utils.utils")

-- auto save cmd
autocmd(
  { "BufLeave"},
  {
    desc = "auto save for files",
    group = augroup("file_auto_process", { clear = true }),
    callback = function()
      if utils_u.is_buffer_change() then
        vim.fn.execute("silent! write")
      end
    end,
  }
)
