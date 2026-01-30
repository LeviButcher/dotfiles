local gh = function(x) return 'https://github.com/' .. x end

vim.pack.add({
    gh("nvim-lua/plenary.nvim"),
    gh("windwp/nvim-ts-autotag"),
    gh("sindrets/diffview.nvim"),
    gh("nvim-mini/mini.icons"),

    { src = gh("ThePrimeagen/harpoon"), version = "harpoon2" },
    gh("nvim-mini/mini.comment"),
    gh("windwp/nvim-autopairs"),
    gh("kylechui/nvim-surround"),
    gh("NeogitOrg/neogit"),
    gh("FabijanZulj/blame.nvim"),
    gh('stevearc/oil.nvim')
})

local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n','<leader>a', function() harpoon:list():add() end )
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


