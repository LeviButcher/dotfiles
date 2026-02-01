local help = require('lib/helpers')

vim.pack.add({
    help.gh("folke/which-key.nvim"),
})


require('which-key').setup({
    preset = "helix",
})


vim.keymap.set("n", "<leader>?", function()
    require('which-key').show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)" })
