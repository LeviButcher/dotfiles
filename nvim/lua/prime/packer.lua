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

    -- Lsp+cmp setup
    use({'neovim/nvim-lspconfig'})
    use({'hrsh7th/nvim-cmp'})
    use({'hrsh7th/cmp-nvim-lsp'})
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")


	-- Diagnostic/Formatter
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

	-- debugger
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } })
	use("theHamsta/nvim-dap-virtual-text")
	use("Hoffs/omnisharp-extended-lsp.nvim")
end)
