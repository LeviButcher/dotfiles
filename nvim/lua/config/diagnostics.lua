local severity = vim.diagnostic.severity

vim.keymap.set("n", "]e", function()
    vim.diagnostic.goto_next({ severity = severity.ERROR })
end)
vim.keymap.set("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = severity.ERROR })
end)

vim.keymap.set("n", "]w", function()
    vim.diagnostic.goto_next({ severity = severity.WARN })
end)

vim.keymap.set("n", "[w", function()
    vim.diagnostic.goto_prev({ severity = severity.WARN })
end)

vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
end)
