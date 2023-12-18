-- If new packages are added, update .luarc.json with new paths to packages
-- from generate packer list

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-tree/nvim-web-devicons")

	-- Colors
	use("catppuccin/nvim")
	use("rebelot/kanagawa.nvim")

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use({
		"nvim-treesitter/nvim-treesitter-context",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
		},
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
		},
	})

	-- Diagnostic/LSP stuff/Formatter
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})

	use({ "nvimdev/guard.nvim", requires = {
		"nvimdev/guard-collection",
	} })

	-- utils
	use({
		"kylechui/nvim-surround",
		tag = "*",
	})
	use("theprimeagen/harpoon")
	use("tpope/vim-fugitive")
	use("mbbill/undotree")
	use("numToStr/Comment.nvim")
	use({
		"folke/zen-mode.nvim",
		opts = {
			plugins = {
				alacritty = {
					enabled = false,
					font = "14", -- font size
				},
			},
		},
	})

	-- debugger
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("Hoffs/omnisharp-extended-lsp.nvim")
end)
