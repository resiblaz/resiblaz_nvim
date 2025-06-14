return {
  -- ui
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
        },
      }
    end,
  },

  -- motions
  {
    {
      "folke/flash.nvim",
      keys = function() return {} end,
    },
  },
}
