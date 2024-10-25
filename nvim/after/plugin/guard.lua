local ft = require("guard.filetype")

-- ft("lua"):fmt("stylua")

ft("typescript,javascript,typescriptreact"):fmt("prettier"):append({
	cmd = "rustywind",
	stdin = true,
	args = {
		"--stdin",
	},
})

ft("json"):fmt("prettier")

ft("rust"):fmt("rustfmt")

ft("css"):fmt("lsp")

-- ft("python"):fmt("black")

-- ft("sql"):fmt("sql-formatter", {
-- 	args = {
-- 		"-l postgresql",
-- 	},
-- })

vim.g.gaurd_config = {
	fmt_on_save = true,
	lsp_as_default_formatter = true,
}
