return {
  -- Surround text objects with symbols
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = "┊",
      virtcolumn = "120",
      highlight = "NonText",
    },
  },

  -- Move lines, blocks easier
  {
    "fedepujol/move.nvim",
    opts = {},
    config = function()
      require("move").setup({})
    end,
  },

  -- Alternate files
  { "tpope/vim-projectionist" },

  -- Split single line or Join multi lines
  { "AndrewRadev/splitjoin.vim" },

  -- Underline word at cursor
  { "itchyny/vim-cursorword" },

  -- Command line completion
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require("wilder")
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
          highlighter = wilder.basic_highlighter(),
          border = "double",
          min_width = "100%", -- minimum height of the popupmenu, can also be a number
          min_height = "20%",
          max_height = "20%",
          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
          reverse = 0, -- if 1, shows the candidates from bottom to top
        }))
      )
      wilder.setup({ modes = { ":", "/", "?" } })
    end,
  },
}
