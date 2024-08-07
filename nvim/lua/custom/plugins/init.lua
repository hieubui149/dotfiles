-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'rmehri01/onenord.nvim', lazy = false, priority = 1000 },
  { 'sainnhe/everforest', lazy = false, priority = 1000 },
  { 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
  { 'nordtheme/vim', lazy = false, priority = 1000 },

  -- File Explorer
  { 'nvim-tree/nvim-tree.lua' },
  -- Icon for file icons
  { 'nvim-tree/nvim-web-devicons' },

  -- Easy Motion
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
      { "X", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- Fold
  { 'kevinhwang91/promise-async' },
  { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' },

  { 'fedepujol/move.nvim' },

  -- Surround
  { 'kylechui/nvim-surround' },
  -- Vim Move
  -- { 'matze/vim-move' },

  -- Projectionist
  { 'tpope/vim-projectionist' },

  -- Ruby break single line to multiple lines
  { 'AndrewRadev/splitjoin.vim' },

  -- Auto pairs or endwise
  { 'windwp/nvim-autopairs', opts = {
    disable_filetype = { "TelescopePrompt" , "vim" },
    enable_afterquote = true
  } },
  { 'tpope/vim-endwise' },

  -- Lazygit integration
  { 'kdheepak/lazygit.nvim' },

  -- Highlight word at cursor
  { 'itchyny/vim-cursorword' },

  -- Github Copilot
  { 'github/copilot.vim' },

  -- Renamer
  -- { 'filipdutescu/renamer.nvim', branch = 'master', requires = { {'nvim-lua/plenary.nvim'} } },

  -- Nvim movement in one go
  { 'booperlv/nvim-gomove', opts = {
    map_defaults = false,
    reindent = true,
    undojoin = true,
    move_past_end_col = false,
  } },

  -- Coc nvim
  -- { 'neoclide/coc.nvim', branch = 'release' },

  -- Winshift
  -- { 'sindrets/winshift.nvim', opts = {
  --     highlight_moving_win = true,  -- Highlight the window being moved
  --   }
  -- },
  {
    "tversteeg/registers.nvim",
    name = "registers",
    keys = {
      { "\"",    mode = { "n", "v" } },
      { "<C-R>", mode = "i" }
    },
    cmd = "Registers",
  },

  -- Vim movement + motion with brackets
  { 'echasnovski/mini.bracketed', version = '*' },
  { 'echasnovski/mini.animate', version = '*' },
  -- { 'echasnovski/mini.indentscope', version = '*' },

  { "RutaTang/quicknote.nvim", config={
    mode = "resident"
  }, dependencies = { "nvim-lua/plenary.nvim"} },

  -- Harpoon for marks
  -- { 'ThePrimeagen/harpoon', opts = {}, dependencies = { "nvim-lua/plenary.nvim" } },

  -- Noice for cmdline replacement with noitify
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- Wilder for command line completion
  { 'gelguy/wilder.nvim' },

  -- Marks
  { 'chentoast/marks.nvim' },

  {
    "roobert/search-replace.nvim",
    config = function()
      require("search-replace").setup({
        -- optionally override defaults
        default_replace_single_buffer_options = "gcI",
        default_replace_multi_buffer_options = "egcI",
      })
    end,
  },

  { "junegunn/fzf", build = "./install --bin" },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end
  },

  { 'pechorin/any-jump.vim' },

  -- Dashboard
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { {'nvim-tree/nvim-web-devicons' } }
  },
  {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
  },

  -- Color display instead of codes
  { 'norcalli/nvim-colorizer.lua' },

  -- Lsp outline
  { 'simrat39/symbols-outline.nvim',
    config = function()
      require("symbols-outline").setup()
    end
  },

  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
  },

  { "fatih/vim-go" },

  { "stevearc/conform.nvim" },
  -- {
  --   "sourcegraph/sg.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --
  --   -- If you have a recent version of lazy.nvim, you don't need to add this!
  --   build = "nvim -l build/init.lua",
  -- },
  --
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    build = function()
      vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
    end,
    event = "VeryLazy",
  },

  -- Precognition uses virtual text and gutter signs to show available motions.
  { "tris203/precognition.nvim" },

  -- Toggle terminal
  { 'akinsho/toggleterm.nvim' },
}
