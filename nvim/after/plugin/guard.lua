local ft = require("guard.filetype")

ft("lua"):fmt("stylua")

ft("typescript,javascript,typescriptreact"):fmt("prettier"):fmt({
	cmd = "rustywind",
	stdin = true,
	args = {
		"--stdin",
	},
})

ft("rust"):fmt("rustfmt")
ft("css"):fmt("css_ls")

require("guard").setup({
	fmt_on_save = true,
	lsp_as_default_formatter = true,
})
