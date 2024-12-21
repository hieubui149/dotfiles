-- [[ Configure Nvim Tree ]]
-- See `:help nvim-tree`

vim.keymap.set('n', '<leader>ls', ':NvimTreeToggle<CR>', { desc = 'Toggle tree [L]ist [S]how' })
vim.keymap.set('n', '<leader>lr', ':NvimTreeToggle<CR>', { desc = 'Toggle tree [L]ist [R]efresh' })
vim.keymap.set('n', '<leader>lf', ':NvimTreeToggle<CR>', { desc = 'Toggle tree [L]ist [F]ind Files' })
-- nnoremap <F1> :NvimTreeToggle<CR>

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5  -- You can change this too

require('nvim-tree').setup {
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },
  filters = {
    dotfiles = true,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    open_file = {
      quit_on_open = true,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  view = {
    side    = 'left',
    number = false,
    relativenumber = true,
    signcolumn = 'yes',
    float = {
      enable = false,
      open_win_config = function()
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        local window_w = screen_w * WIDTH_RATIO
        local window_h = screen_h * HEIGHT_RATIO
        local window_w_int = math.floor(window_w)
        local window_h_int = math.floor(window_h)
        local center_x = (screen_w - window_w) / 2
        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                         - vim.opt.cmdheight:get()
        return {
          border = "rounded",
          relative = "editor",
          row = center_y,
          col = center_x,
          width = window_w_int,
          height = window_h_int,
        }
        end,
    },
    width = 50,
    -- width = function()
    --   return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
    -- end,
  }
}

-- set background to transparent
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { bg = 'NONE' })
