local help = require('lib/helpers')

vim.pack.add({
    help.gh("nvim-telescope/telescope.nvim"),
    { src = help.gh('nvim-telescope/telescope-fzf-native.nvim'), build = 'make' }
})


vim.keymap.set('n', "<leader>ff",
    function()
        require("telescope.builtin").find_files()
    end)

vim.keymap.set('n', "<leader>fg",
    function()
        require("telescope.builtin").live_grep()
    end)

vim.keymap.set('n', "<leader>fb",
    function()
        require("telescope.builtin").buffers()
    end)

vim.keymap.set('n', "<leader>fh",
    function()
        require("telescope.builtin").help_tags()
    end)

vim.keymap.set('n', "<C-k>",
    function()
        require("telescope.builtin").keymaps()
    end)

vim.keymap.set('n', "<C-p>",
    function()
        require("telescope.builtin").git_files()
    end)

vim.keymap.set('n', "<leader>ps",
    function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep >") })
    end)

vim.keymap.set('n',
    "<leader>rp",
    function()
        require("telescope.builtin").resume()
    end)
