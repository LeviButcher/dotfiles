local help = require('lib/helpers')

vim.pack.add({
    help.gh("folke/snacks.nvim"),
})

require("snacks").setup(
    {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = false },
    }

)

vim.keymap.set("n", "<leader>gs", Snacks.lazygit.open, { desc = "Lazygit" })


vim.keymap.set('n', "<leader>ff",
    function()
        Snacks.picker.files({ hidden = true })
    end,
    { desc = "Snacks find files" }
)

vim.keymap.set('n', "<leader>fg",
    function()
        Snacks.picker.grep()
    end,
    { desc = "Snacks live grep" }
)

vim.keymap.set('n', "<leader>fb",
    function()
        Snacks.picker.buffers()
    end,
    { desc = "Snacks buffers" }
)

vim.keymap.set('n', "<leader>fh",
    function()
        Snacks.picker.help()
    end,
    { desc = "Snacks help " }
)

vim.keymap.set('n', "<C-k>",
    function()
        Snacks.picker.keymaps()
    end,
    { desc = "Snacks keymaps" }
)

vim.keymap.set('n', "<C-p>",
    function()
        Snacks.picker.git_files()
    end,
    { desc = "Snacks git files" }
)


vim.keymap.set('n',
    "<leader>rp",
    function()
        Snacks.picker.resume()
    end,
    { desc = "Snacks resume" }
)

vim.keymap.set('n',
    "<leader>ud",
    function()
        Snacks.picker.undo()
    end,
    { desc = "Snacks undo history" }
)
