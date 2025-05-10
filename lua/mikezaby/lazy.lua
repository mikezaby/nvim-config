local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	------------------
	--      UI      --
	------------------
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground" },

	{ "lewis6991/gitsigns.nvim", config = true },
	{
		"nvim-lualine/lualine.nvim",
		config = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"norcalli/nvim-colorizer.lua",
	},
	{ "nacro90/numb.nvim", opts = { show_numbers = true } },
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},

	-------------------
	--      LSP      --
	-------------------
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v4.x",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{ "L3MON4D3/LuaSnip" },
		},
	},
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},
	{
		"dmmulroy/tsc.nvim",
		opts = {
			auto_open_qflist = false,
			run_as_monorepo = true,
			flags = {
				noEmit = true,
				skipLibCheck = true,
				watch = true,
			},
		},
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		config = true,
	},

	---------------------
	--      Utils      --
	---------------------
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			-- calling `setup` is optional for customization
			require("fzf-lua").setup({})
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	{ "mbbill/undotree" },
	{ "preservim/nerdcommenter" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},
	{
		"RaafatTurki/hex.nvim",
		config = true,
	},
	{ "ellisonleao/glow.nvim", config = true, cmd = "Glow" },
})
