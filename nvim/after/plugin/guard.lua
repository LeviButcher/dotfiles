local ft = require("guard.filetype")

ft("lua"):fmt("stylua")

ft("typescript,javascript,typescriptreact"):fmt("prettier"):append({
	cmd = "rustywind",
	stdin = true,
	args = {
		"--stdin",
	},
})

ft("rust"):fmt("rustfmt")

ft("css"):fmt("lsp")

require("guard").setup({
	fmt_on_save = true,
	lsp_as_default_formatter = true,
})
