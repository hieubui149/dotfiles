-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	-- { "rmehri01/onenord.nvim", lazy = false, priority = 1000 },
	{ "sainnhe/everforest", lazy = false, priority = 1000 },
	-- { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	-- { "nordtheme/vim", lazy = false, priority = 1000 },

	-- a smooth scrolling neovim
	{ "karb94/neoscroll.nvim", opts = {} },

	-- display color column as character
	{ "lukas-reineke/virt-column.nvim", opts = {
		char = "┊",
		virtcolumn = "120",
		highlight = "NonText",
	} },

	-- File Explorer
	{ "nvim-tree/nvim-tree.lua" },
	-- Icon for file icons
	{ "nvim-tree/nvim-web-devicons" },

	-- Easy Motion
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"s",
				mode = { "n", "o", "x" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"X",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},

	-- Fold
	-- { "kevinhwang91/promise-async" },
	-- { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },

	{ "fedepujol/move.nvim" },

	-- Surround
	{ "kylechui/nvim-surround" },
	-- Vim Move
	-- { 'matze/vim-move' },

	-- Projectionist
	{ "tpope/vim-projectionist" },

	-- Ruby break single line to multiple lines
	{ "AndrewRadev/splitjoin.vim" },

	-- Auto pairs or endwise
	{
		"windwp/nvim-autopairs",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
			enable_afterquote = true,
		},
	},
	{ "tpope/vim-endwise" },

	-- Lazygit integration
	{ "kdheepak/lazygit.nvim" },

	-- Highlight word at cursor
	{ "itchyny/vim-cursorword" },

	-- Github Copilot
	{ "github/copilot.vim" },

	-- Nvim movement in one go
	{
		"booperlv/nvim-gomove",
		opts = {
			map_defaults = false,
			reindent = true,
			undojoin = true,
			move_past_end_col = false,
		},
	},

	{
		"tversteeg/registers.nvim",
		name = "registers",
		keys = {
			{ '"', mode = { "n", "v" } },
			{ "<C-R>", mode = "i" },
		},
		cmd = "Registers",
	},

	-- Vim movement + motion with brackets
	{ "echasnovski/mini.bracketed", version = "*" },
	-- { "echasnovski/mini.animate", version = "*" },
	-- { 'echasnovski/mini.indentscope', version = '*' },

	{ "RutaTang/quicknote.nvim", config = {
		mode = "resident",
	}, dependencies = { "nvim-lua/plenary.nvim" } },

	-- Noice for cmdline replacement with noitify
	{
		"folke/noice.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-- Wilder for command line completion
	{ "gelguy/wilder.nvim" },

	-- Marks
	{ "chentoast/marks.nvim" },

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
		end,
	},

	{ "pechorin/any-jump.vim" },

	-- Dashboard
	-- {
	-- 	"glepnir/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	-- },
	-- {
	-- 	"startup-nvim/startup.nvim",
	-- 	requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	-- },

	-- Color display instead of codes
	{ "norcalli/nvim-colorizer.lua" },

	-- Lsp outline
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	{
		"shellRaining/hlchunk.nvim",
		event = { "UIEnter" },
	},

	{ "fatih/vim-go" },

	{ "stevearc/conform.nvim" },
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this if you want to always pull the latest change
		opts = {
			provider = "copilot",
			auto_suggestions_provider = "copilot"
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				'MeanderingProgrammer/render-markdown.nvim',
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},

	-- Precognition uses virtual text and gutter signs to show available motions.
	{ "tris203/precognition.nvim" },

	-- Toggle terminal
	{ "akinsho/toggleterm.nvim" },

	-- Enhance vim macros
	{
		"chrisgrieser/nvim-recorder",
		dependencies = "rcarriga/nvim-notify", -- optional
		opts = {}, -- required even with default settings, since it calls `setup()`
	},

	-- color the border of active window
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

	-- scrollbar
	{
		"petertriho/nvim-scrollbar",
		config = function()
			-- local colors = require("tokyonight.colors").setup()
			-- require("scrollbar").setup({
			-- 	handle = {
			-- 		color = colors.bg_highlight,
			-- 	},
			-- 	marks = {
			-- 		Cursor = { text = "◀", color = colors.info },
			-- 		Search = { text = { "-", "=" }, color = colors.orange },
			-- 		Error = { color = colors.error },
			-- 		Warn = { color = colors.warning },
			-- 		Info = { color = colors.info },
			-- 		Hint = { color = colors.hint },
			-- 		Misc = { color = colors.purple },
			-- 	}
			-- })
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
		end,
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			-- require('hlslens').setup() is not required
			require("scrollbar.handlers.search").setup({
					-- hlslens config overrides
			})
		end,
	},

  -- {
		-- 'romgrk/barbar.nvim',
  --   dependencies = {
  --     'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  --     'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  --   },
  --   init = function() vim.g.barbar_auto_setup = false end,
  --   opts = {
  --     -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
  --     -- animation = true,
  --     -- insert_at_start = true,
  --     -- …etc.
  --   },
  --   version = '^1.0.0', -- optional: only update when a new 1.x version is released
  -- },

	-- For terminal integration
	{ "folke/snacks.nvim", },

	-- Funny
	{
    'tamton-aquib/duck.nvim',
    config = function()
			vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
			vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
			vim.keymap.set('n', '<leader>d1', function() require("duck").hatch("🦆", 10) end, {}) -- A pretty fast duck
			vim.keymap.set('n', '<leader>d2', function() require("duck").hatch("🐈", 0.75) end, {}) -- Quite a mellow cat
			vim.keymap.set('n', '<leader>d3', function() require("duck").hatch("🦋", 10) end, {}) -- Quite a mellow cat
			vim.keymap.set('n', '<leader>d4', function() require("duck").hatch("🦀", 10) end, {}) -- Quite a mellow cat
    end
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"suketa/nvim-dap-ruby",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
	},
}
