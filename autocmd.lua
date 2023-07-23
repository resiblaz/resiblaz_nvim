local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

 autocmd(
  { "BufLeave"},
  {
    desc = "auto save for files",
    group = augroup("file_auto_process", { clear = true }),
    callback = function()
      vim.fn.execute("silent! write")
    end,
  }
)
