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

require("mini.comment").setup()

require('nvim-autopairs').setup()

require("nvim-surround").setup()

require("blame").setup()

require('mini.icons').setup()

require('oil').setup({
    keymaps = {
        ["<C-p>"] = false,
        ["="] = "actions.preview",
        ["<C-l>"] = false,
        ["<C-h>"] = false
    },
    view_options = {
        show_hidden = true
    }
})

vim.keymap.set('n', '<leader>pv',
    function() require('oil').open() end,
    { desc = "file browser (Oil)" })

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n', '<leader>a',
    function() harpoon:list():add() end,
    { desc = "add file (Harpoon)" })
vim.keymap.set('n', "<C-e>",
    function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
    { desc = "toggle menu (Harpoon)" })
vim.keymap.set('n', "<C-h>", function() harpoon:list():select(1) end, { desc = "goto 1 (Harpoon)" })
vim.keymap.set('n', "<C-t>", function() harpoon:list():select(2) end, { desc = "goto 2 (Harpoon)" })
vim.keymap.set('n', "<C-n>", function() harpoon:list():select(3) end, { desc = "goto 3 (Harpoon)" })
vim.keymap.set('n', "<C-s>", function() harpoon:list():select(4) end, { desc = "goto 4 (Harpoon)" })
