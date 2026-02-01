local help = require('lib/helpers')

vim.pack.add({
    help.gh("rafamadriz/friendly-snippets"),
    { src = help.gh('saghen/blink.cmp'), version = "v1.8.0" },
})



require("blink.cmp").setup({
    signature = { enabled = true }
})
