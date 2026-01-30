local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    gh("mason-org/mason.nvim"),
    gh("Decodetalkers/csharpls-extended-lsp.nvim"),
})

require("mason").setup()
require("csharpls_extended").buf_read_cmd_bind()
