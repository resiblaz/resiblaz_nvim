-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<Leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<Leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- standard options
    ["j"] = { "v:count == 0 ? 'gj' : 'j'", expr = true, desc = "Move cursor down" },
    ["k"] = { "v:count == 0 ? 'gk' : 'k'", expr = true, desc = "Move cursor up" },
    ["<C-j>"] = {":m .+1<CR>==", desc = "move currebt line down 1 line"},
    ["<C-k>"] = {":m .-2<CR>==", desc = "move currebt line up 1 line"},

    -- split manager
    -- split screen keymaps
    ["<Leader>sv"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },
    ["<Leader>sh"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<Leader>so"] = { "<C-w>o", desc = "Close other split window" },
    ["<Leader>sc"] = { "<C-w>c", desc = "Close select window" },
    ----  vertical scale control
    ["<Leader>s,"] = { ":vertical resize -20<CR>", desc = "vertical resize -20" },
    ["<Leader>s."] = { ":vertical resize +20<CR>", desc = "vertical resize +20" },
    ["<Leader>sn"] = { ":vertical resize -2<CR>", desc = "vertical resize -2" },
    ["<Leader>sm"] = { ":vertical resize +2<CR>", desc = "vertical resize +2" },
    ----  Horizontal scale control
    ["<Leader>sj"] = { ":resize +10<CR>", desc = "Horizontal resize +10" },
    ["<Leader>sk"] = { ":resize -10<CR>", desc = "Horizontal resize -10" },
    ["<Leader>su"] = { ":resize +2<CR>", desc = "Horizontal resize -2" },
    ["<Leader>si"] = { ":resize -2<CR>", desc = "Horizontal resize +2" },
    ["<Leader>s="] = { "<C-w>=", desc = "equal proportion" },
    ["<A-h>"] = { "<C-w>h", desc = "Move to left split" },
    ["<A-j>"] = { "<C-w>j", desc = "Move to below split" },
    ["<A-k>"] = { "<C-w>k", desc = "Move to above split" },
    ["<A-l>"] = { "<C-w>l", desc = "Move to right split" },


    -- manager buffer
    ["<Leader>bw"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<Leader>bW"] = { function() require("astronvim.utils.buffer").close(0, true) end, desc = "Force close buffer" },
    ["<Leader>bl"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<Leader>bh"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    [">b"] = {
      function() require("astronvim.utils.buffer").move(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Move buffer tab right",
    },
    ["<b"] = {
      function() require("astronvim.utils.buffer").move(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Move buffer tab left",
    },
    ["<Leader>bo"] = {
      function()
        require("astronvim.utils.status.heirline").buffer_picker(function(bufnr) vim.api.nvim_win_set_buf(0, bufnr) end)
      end,
      desc = "Select buffer from tabline",
    },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
