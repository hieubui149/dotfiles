# This guide will show you how to change theme for this configuration

## Step 1: Wezterm

Changing colorscheme for wezterm is simple. Navigate to Wezterm configuration file in `wezterm/wezterm.lua`, and change the colorscheme to your liking. The change will affect immediately after saving the file.

```lua
-- use an available color scheme
config.color_scheme = 'Everforest Light Soft (Gogh)'

-- or define your own color scheme
config.colors = {
  background = '#3A464C',
}
```

## Step 2: Neovim

Changing colorscheme for neovim requires update in many place to ensure consitency across the whole neovim editor

### Adding neovim new colorscheme

2.1. Find the colorscheme plugin you want to use, and add it to the plugin list in `/nvim/lua/custom/plugins/init.lua`. For example, to add `tokynight` colorscheme, add the following line to the plugin list:

```lua
{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
```

Run `:Lazy` to install the colorscheme. Open the `/nvim/lua/custom/theme.lua` file and modify to use the new colorscheme:

```lua
-- make sure you have the following line in the file
vim.cmd.colorscheme 'tokynight'

-- if your colorscheme support configuration, add them there as well

require("tokyonight").setup({
    style = "moon",
    -- other configuration
})
```

2.2. Update `lualine` to use the new colorscheme. Open the `nvim/lua/custom/lualine.lua` file and update lualine theme option

```lua
require('lualine').setup {
  options = {
    theme = 'tokyonight'
  }
}
```

2.3. Update `nvim-zh/colorful-winsep.nvim`. Open the `/nvim/lua/custom/plugins/init.lua` file, find the `nvim-zh/colorful-winsep.nvim` plugin and update the colorscheme to use the new colorscheme

```lua
{
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinLeave" },
    opts = {
        hi = {
            bg = "#16161E",
            fg = "#83C092",
        },
    },
},
```

2.4. Update `petertriho/nvim-scrollbar`. Open the `/nvim/lua/custom/plugins/init.lua` file, find the `petertriho/nvim-scrollbar` plugin and update the colorscheme to use the new colorscheme

```lua
    require("scrollbar").setup({
        handle = {
            color = '#4D5960',
        },
        marks = {
            Cursor = { text = "◀", color = '#83C092' },
            Search = { text = { "-", "=" }, color = '#E69875' },
            Error = { color = '#E67E80' },
            Warn = { color = '#DBBC7F' },
            Info = { color = '#7FBBB3' },
            Hint = { color = '#D699B6' },
            Misc = { color = '#D699B6' },
        }
    })
```

Restart neovim to see the changes.

## Step 3: Tmux

There are some pre-configured theme in `/tmux/themes` directory. To change the theme, open the `tmux/.tmux.conf` file and update the theme to your liking:

```sh
# Find the following line in the file
# # [START]----------- THEME CONFIGURATION ------------------
# and update the theme to your liking
source-file ~/.config/tmux/themes/tokyonight.tmux
# make sure only one theme is sourced at a time
```

To add your own theme, create a new file in the `/tmux/themes` directory and update the `tmux/.tmux.conf` file to source the new theme file.

Source tmux configuration file to see the changes.

```sh
tmux source-file ~/.tmux.conf
```
