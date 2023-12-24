-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
--
local M = {}

function M.mapping(maps)
  local utils = require("astronvim.utils")
  local is_available = utils.is_available
  local utils_u = require("user.utils.utils")


  -- mappings for base imp 
  M.base_mappings(maps)
  M.split_mappings(maps)
  M.buffer_mappings(maps)

  -- mappings for plugins 
  M.flash_mappings_p(maps, is_available)
  M.comment_mappings_p(maps, is_available, utils_u)
  M.toggleterm_mappings(maps)
  return maps
end

-- base mappings
function M.base_mappings(maps)
    maps.n["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" }
    maps.n["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" }
    maps.n["<C-j>"] = {":m .+1<CR>==", desc = "move currebt line down 1 line"}
    maps.n["<C-k>"] = {":m .-2<CR>==", desc = "move currebt line up 1 line"}
end


-- buffer mappings
function M.buffer_mappings(maps)
    maps.n["<C-w>"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" }
    maps.n["<C-W>"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" }
    maps.n["<C-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" }
    maps.n["<C-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    }
    maps.n[">b"] = {
      function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Move buffer tab right",
    }
    maps.n["<b"] = {
      function() require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Move buffer tab left",
    }
    maps.n["<C-p>"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
      end,
      desc = "Select buffer from tabline",
    }
end

-- split mappings manager
function M.split_mappings(maps)
    -- split screen keymaps
    maps.n["<Leader>sv"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
    maps.n["<Leader>sh"] = { "<cmd>split<cr>", desc = "Horizontal Split" }
    maps.n["<Leader>so"] = { "<C-w>o", desc = "Close other split window" }
    maps.n["<Leader>sc"] = { "<C-w>c", desc = "Close select window" }
    ---  vertical scale control
    maps.n["<Leader>s,"] = { ":vertical resize -20<CR>", desc = "vertical resize -20" }
    maps.n["<Leader>s."] = { ":vertical resize +20<CR>", desc = "vertical resize +20" }
    maps.n["<Leader>sn"] = { ":vertical resize -2<CR>", desc = "vertical resize -2" }
    maps.n["<Leader>sm"] = { ":vertical resize +2<CR>", desc = "vertical resize +2" }
    ---  Horizontal scale control
    maps.n["<Leader>sj"] = { ":resize +10<CR>", desc = "Horizontal resize +10" }
    maps.n["<Leader>sk"] = { ":resize -10<CR>", desc = "Horizontal resize -10" }
    maps.n["<Leader>su"] = { ":resize +2<CR>", desc = "Horizontal resize -2" }
    maps.n["<Leader>si"] = { ":resize -2<CR>", desc = "Horizontal resize +2" }
    maps.n["<Leader>s="] = { "<C-w>=", desc = "equal proportion" }
    maps.n["<A-h>"] = { "<C-w>h", desc = "Move to left split" }
    maps.n["<A-j>"] = { "<C-w>j", desc = "Move to below split" }
    maps.n["<A-k>"] = { "<C-w>k", desc = "Move to above split" }
    maps.n["<A-l>"] = { "<C-w>l", desc = "Move to right split" }

end

-- plugin mappings
---- flash mappings
function M.flash_mappings_p(maps, is_available)
  if is_available "flash.nvim" then
    maps.n["<leader>,"] = {
      function() require("flash").jump() end,
      desc = "Flash",
    }
    maps.x["<leader>,"] = {
      function() require("flash").jump() end,
      desc = "Flash",
    }
    maps.o["<leader>,"] = {
      function() require("flash").jump() end,
      desc = "Flash",
    }
    maps.n["<leader><leader>,"] = {
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    }
    maps.x["<leader><leader>,"] = {
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    }
    maps.o["<leader><leader>,"] = {
      function() require("flash").treesitter() end,
      desc = "Flash Treesitter",
    }
  end
end

---- comment mappings
function M.comment_mappings_p(maps, is_available, utils_u)
  if is_available "flash.nvim" then
    if utils_u.is_mac() then
      maps.n["<C-/>"] = {
        function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Toggle comment line",
      }
      maps.v["<C-/>"] = {
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "Toggle comment for selection",
      }
    elseif utils_u.is_win() then
      maps.n["<C-_>"] = {
        function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Toggle comment line",
      }
      maps.v["<C-_>"] = {
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        desc = "Toggle comment for selection",
      }
    end
  end
end


--- toggleterm mappings
function M.toggleterm_mappings(maps)
  maps.t["<Esc>"] = {"<C-\\><C-n>"}
end


return M
