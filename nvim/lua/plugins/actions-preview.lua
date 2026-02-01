local help = require('lib/helpers')

vim.pack.add({
    help.gh("aznhe21/actions-preview.nvim"),
})


require("actions-preview").setup {
    diff = {
        algorithm = "patience",
        ignore_whitespace = true,
    },
    telescope = require("telescope.themes").get_dropdown { winblend = 10 },
}

vim.keymap.set({ "v", "n" },
    "<leader>gp",
    require('actions-preview').code_actions,
    { desc = "Preview Code Actions (actions-preview)" })
