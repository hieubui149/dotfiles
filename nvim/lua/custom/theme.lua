-- ONENORD THEME
-- local colors = {
--   fg = "#C8D0E0",
--   fg_light = "#E5E9F0",
--   bg = "#2E3440",
--   gray = "#646A76",
--   light_gray = "#6C7A96",
--   cyan = "#88C0D0",
--   blue = "#81A1C1",
--   dark_blue = "#5E81AC",
--   green = "#A3BE8C",
--   light_green = "#8FBCBB",
--   dark_red = "#BF616A",
--   red = "#D57780",
--   light_red = "#DE878F",
--   pink = "#E85B7A",
--   dark_pink = "#E44675",
--   orange = "#D08F70",
--   yellow = "#EBCB8B",
--   purple = "#B988B0",
--   light_purple = "#B48EAD",
--   none = "NONE",
-- }
-- require('onenord').setup({
--   borders = true,
--   fade_nc = false,
--   disable = {
--     background = true, -- Disable setting the background color
--     cursorline = false, -- Disable the cursorline
--     eob_lines = true, -- Hide the end-of-buffer lines
--   },
--   custom_colors = {
--     purple = "#bd82d1",
--     light_purple = "#d693ed",
--   },
-- })
-- vim.cmd.colorscheme 'onenord'

-- NORD THEME
-- vim.cmd.colorscheme 'nord'

-- EVERFOREST THEME
vim.g.everforest_transparent_background = 1
-- vim.g.everforest_dim_inactive_windows = 1
vim.cmd.colorscheme 'everforest'
-- vim.o.background = "light"

-- TOKYONIGHT THEME
require("tokyonight").setup({
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  -- light_style = "night", -- The theme is used when the background is set to light
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  on_highlights = function(highlights, colors) end,
})
-- vim.cmd.colorscheme 'tokyonight'

-- overcome the italic issue causes solid background in neovim
vim.api.nvim_set_hl(0, "Comment", { fg = "#859289" })
-- set background to none for transparency
vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
