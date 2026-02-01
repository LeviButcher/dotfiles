local help = require('lib/helpers')

vim.pack.add({
    help.gh("aznhe21/actions-preview.nvim"),
})


require("actions-preview").setup {
    backend = { "snacks" }
}

vim.keymap.set({ "v", "n" },
    "<leader>gp",
    require('actions-preview').code_actions,
    { desc = "Preview Code Actions (actions-preview)" })
