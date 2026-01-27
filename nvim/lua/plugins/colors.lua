return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        init = function()
            local color = "tokyonight-night"
            vim.g.mellow_italic_functions = true
            vim.g.mellow_bold_functions = true

            vim.cmd.colorscheme(color)
        end,
        dependencies = {
            "rose-pine/neovim",
            "folke/tokyonight.nvim",
        }
    }
}
