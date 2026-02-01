local help = require('lib/helpers')

vim.pack.add({
    help.gh("nvim-telescope/telescope.nvim"),
    { src = help.gh('nvim-telescope/telescope-fzf-native.nvim'), build = 'make' }
})


vim.keymap.set('n', "<leader>ff",
    function()
        require("telescope.builtin").find_files()
    end,
    { desc = "Telescope find files" }
)

vim.keymap.set('n', "<leader>fg",
    function()
        require("telescope.builtin").live_grep()
    end,
    { desc = "Telescope live grep" }
)

vim.keymap.set('n', "<leader>fb",
    function()
        require("telescope.builtin").buffers()
    end,
    { desc = "Telescope buffers" }
)

vim.keymap.set('n', "<leader>fh",
    function()
        require("telescope.builtin").help_tags()
    end,
    { desc = "Telescope help tags" }
)

vim.keymap.set('n', "<C-k>",
    function()
        require("telescope.builtin").keymaps()
    end,
    { desc = "Telescope keymaps" }
)

vim.keymap.set('n', "<C-p>",
    function()
        require("telescope.builtin").git_files()
    end,
    { desc = "Telescope git files" }
)

vim.keymap.set('n', "<leader>ps",
    function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep >") })
    end,
    { desc = "Telescope grep string" }
)

vim.keymap.set('n',
    "<leader>rp",
    function()
        require("telescope.builtin").resume()
    end,
    { desc = "Telescope resume" }
)
