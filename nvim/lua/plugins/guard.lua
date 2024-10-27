return {
    {
        "nvimdev/guard.nvim",
        dependencies = {
            "nvimdev/guard-collection",
        },
        config = function()
            local ft = require("guard.filetype")

            ft("lua"):fmt("lsp")

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

            vim.g.guard_config = {
                fmt_on_save = true,
                lsp_as_default_formatter = true,
            }
        end
    },
}
