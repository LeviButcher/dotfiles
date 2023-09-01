return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-tree/nvim-web-devicons")

	-- Colors
	use("catppuccin/nvim")

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

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	-- Diagnostic/LSP stuff/Formatter
	use({
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
	})
	use("nvimdev/guard.nvim")

	-- utils
	use({
		"kylechui/nvim-surround",
		tag = "*",
	})
	use("theprimeagen/harpoon")
	use("tpope/vim-fugitive")
	use("mbbill/undotree")
	use("numToStr/Comment.nvim")

	-- debugger
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")

	-- Language Toolkits
	use("folke/neodev.nvim")
end)
