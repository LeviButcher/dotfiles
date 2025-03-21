return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files()
                end,
                desc = 'Find Files'
            },
            {
                "<leader>fg",
                function()
                    require("telescope.builtin").live_grep()
                end,
                desc = 'Rip Grep project'
            },
            {
                "<leader>fb",
                function()
                    require("telescope.builtin").buffers()
                end,
                desc = 'Search Buffers'
            },
            {
                "<leader>fh",
                function()
                    require("telescope.builtin").help_tags()
                end,
                desc = 'Search Help wiki'
            },
            {
                "<C-k>",
                function()
                    require("telescope.builtin").keymaps()
                end,
                desc = 'Search Keymaps'
            },
            {
                "<C-p>",
                function()
                    require("telescope.builtin").git_files()
                end,
                desc = 'Find Files in Git'
            },
            {
                "<leader>ps",
                function()
                    require("telescope.builtin").grep_string({ search = vim.fn.input("Grep >") })
                end,
                desc = 'Grep project'
            },
        }
    },
}
