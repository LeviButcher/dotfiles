vim.pack.add({
    "https://github.com/folke/tokyonight.nvim",
    "https://github.com/catppuccin/nvim",
    "https://github.com/rose-pine/neovim",
})

require('tokyonight').setup({
    transparent = true,
    sidebars = 'transparent',
    floats = 'transparent'
})

vim.cmd.colorscheme("tokyonight")
