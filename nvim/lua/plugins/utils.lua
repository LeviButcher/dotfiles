local help = require('lib/helpers')

vim.pack.add({
    help.gh("nvim-lua/plenary.nvim"),
    help.gh("windwp/nvim-ts-autotag"),
    help.gh("sindrets/diffview.nvim"),
    help.gh("nvim-mini/mini.icons"),

    { src = help.gh("ThePrimeagen/harpoon"), version = "harpoon2" },
    help.gh("nvim-mini/mini.comment"),
    help.gh("windwp/nvim-autopairs"),
    help.gh("kylechui/nvim-surround"),
    help.gh("NeogitOrg/neogit"),
    help.gh("FabijanZulj/blame.nvim"),
    help.gh('stevearc/oil.nvim')
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
vim.keymap.set('n', "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set('n', "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set('n', "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set('n', "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set('n', "<C-s>", function() harpoon:list():select(4) end)
vim.keymap.set('n', "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set('n', "<C-S-N>", function() harpoon:list():next() end)

require("mini.comment").setup()

require('nvim-autopairs').setup()

require("nvim-surround").setup()

require("neogit").setup({})

vim.keymap.set('n', '<leader>gs', function() require('neogit').open() end)

require("blame").setup()

require('mini.icons').setup()
require('oil').setup({
    keymaps = {
        ["<C-p>"] = false,
        ["="] = "actions.preview"
    },
    view_options = {
        show_hidden = true
    }
})

vim.keymap.set('n', '<leader>pv', function() require('oil').open() end)
