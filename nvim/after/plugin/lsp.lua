-- Makes NVIM lua config files work with lsp
require("neodev").setup({
	library = {
		plugins = { "nvim-dap-ui" },
		type = true,
	},
})

local lsp = require("lsp-zero").preset({
	float_border = "rounded",
	call_servers = "local",
	configure_diagnostics = true,
	setup_servers_on_start = true,
	set_lsp_keymaps = {
		preserve_mappings = false,
		omit = {},
	},
	manage_nvim_cmp = {
		set_sources = "recommended",
		set_basic_mappings = true,
		set_extra_mappings = false,
		use_luasnip = true,
		set_format = true,
		documentation_window = true,
	},
})

lsp.on_attach(function(_, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

vim.lsp.handlers["textDocument/publishDiagnostics"] =
	vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = true })

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "path" },
	},
	mapping = {
		-- `Enter` key to confirm completion
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		-- Ctrl+Space to trigger completion menu
		["<C-Space>"] = cmp.mapping.complete(),
		-- Navigate between snippet placeholder
		["<C-f>"] = cmp_action.luasnip_jump_forward(),
		["<C-b>"] = cmp_action.luasnip_jump_backward(),
	},
})
