local help = require('lib/helpers')

vim.pack.add({
    help.gh("folke/tokyonight.nvim"),
    help.gh("catppuccin/nvim"),
    help.gh("rose-pine/neovim"),
})

require('tokyonight').setup({
    transparent = true,
    sidebars = 'transparent',
    floats = 'transparent'
})

vim.cmd.colorscheme("tokyonight")
