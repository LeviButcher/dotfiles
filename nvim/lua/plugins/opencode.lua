local help = require('lib/helpers')

vim.pack.add({
    help.gh("sudo-tee/opencode.nvim"),
    help.gh("nvim-lua/plenary.nvim"),
    help.gh("MeanderingProgrammer/render-markdown.nvim"),
})

require('render-markdown').setup({
    anti_conceal = { enabled = true },
    file_types = { "markdown", "opencode_output" }
})

require("opencode").setup({})
