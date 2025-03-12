return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.g.everforest_transparent_background = 1
    end,
  },

  -- Configure LazyVim colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },

  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
    opts = {
      hi = {
        -- bg = "#16161E",
        -- fg = "#82aaff",
        fg = "#83C092",
      },
    },
  },
}
