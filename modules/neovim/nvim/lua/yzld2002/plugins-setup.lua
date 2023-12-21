-- auto install packer if not installed
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

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

-- add list of plugins to install
lazy.setup({
	spec = {
		"nvim-lua/plenary.nvim",
		-- colorscheme
		-- "Shatur/neovim-ayu"
		-- "martinsione/darkplus.nvim"
		"navarasu/onedark.nvim",
		-- toggle split maximum
		"szw/vim-maximizer",
		-- ys, ds, cs
		"tpope/vim-surround",
		-- gr
		"vim-scripts/ReplaceWithRegister",
		-- gc
		"numToStr/Comment.nvim",
		-- file explorer
		"nvim-tree/nvim-tree.lua",
		-- icons
		"kyazdani42/nvim-web-devicons",
		-- status line
		"nvim-lualine/lualine.nvim",
		"arkav/lualine-lsp-progress",

		-- tab line
		"romgrk/barbar.nvim",

		-- fuzzy finding
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x" },
		"nvim-telescope/telescope-live-grep-args.nvim",

		-- auto completion
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",

		-- snippets
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",

		-- managing & installing lsp servers, linters & formatters
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",

		-- configuring lsp servers
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		{ "glepnir/lspsaga.nvim", branch = "main" },
		"jose-elias-alvarez/typescript.nvim",
		"simrat39/rust-tools.nvim",
		"onsails/lspkind.nvim",

		-- formatting & linting
		"jose-elias-alvarez/null-ls.nvim",
		"jayp0521/mason-null-ls.nvim",

		--- debugging
		"mfussenegger/nvim-dap",
		"jay-babu/mason-nvim-dap.nvim",

		-- treesitter configuration
		{
			"nvim-treesitter/nvim-treesitter",
			build = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		},

		-- auto closing
		"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
		{ "windwp/nvim-ts-autotag" }, -- autoclose tags

		-- git integration
		"lewis6991/gitsigns.nvim", -- show line modifications on left hand side
		"f-person/git-blame.nvim", -- git blame
		"sindrets/diffview.nvim",

		-- code outline
		"stevearc/aerial.nvim",

		-- trouble list
		"folke/trouble.nvim",

		-- run test
		"klen/nvim-test",

		-- toggle term
		{ "akinsho/toggleterm.nvim", version = "*" },
	},
})
