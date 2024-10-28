return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        init = function()
            local color = "catppuccin-mocha"
            vim.g.mellow_italic_functions = true
            vim.g.mellow_bold_functions = true

            vim.cmd.colorscheme(color)
        end
    },
}
