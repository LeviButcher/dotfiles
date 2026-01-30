# C# File
vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo[0][0].foldmethod = 'expr'

require("csharpls_extended").buf_read_cmd_bind()
