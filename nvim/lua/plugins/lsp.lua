local help = require('lib/helpers')

vim.pack.add({
    help.gh("mason-org/mason.nvim"),
    help.gh("Decodetalkers/csharpls-extended-lsp.nvim"),
})

require("mason").setup()
require("csharpls_extended").buf_read_cmd_bind()
