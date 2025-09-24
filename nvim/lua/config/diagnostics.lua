# Diagnostic Setup

vim.diagnostic.config({
    virtual_lines = true,
})

vim.keymap.set("n", "]e", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = 1 })
end)

vim.keymap.set("n", "[e", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = -1 })
end)

vim.keymap.set("n", "]w", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = 1 })
end)

vim.keymap.set("n", "[w", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.WARN, count = -1 })
end)

vim.keymap.set("n", "gl", function()
    vim.diagnostic.open_float()
end)
