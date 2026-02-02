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
    help.gh("FabijanZulj/blame.nvim"),
    help.gh('stevearc/oil.nvim')
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n', '<A-a>', function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set('n', "<A-h>",
    function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    { desc = "Harpoon toggle menu" })
vim.keymap.set('n', "<A-q>", function() harpoon:list():select(1) end, { desc = "Harpoon goto 1" })
vim.keymap.set('n', "<A-w>", function() harpoon:list():select(2) end, { desc = "Harpoon goto 2" })
vim.keymap.set('n', "<A-e>", function() harpoon:list():select(3) end, { desc = "Harpoon goto 3" })
vim.keymap.set('n', "<A-r>", function() harpoon:list():select(4) end, { desc = "Harpoon goto 4" })

require("mini.comment").setup()

require('nvim-autopairs').setup()

require("nvim-surround").setup()

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

vim.keymap.set('n', '<leader>pv', function() require('oil').open() end, { desc = "Oil file browser" })
