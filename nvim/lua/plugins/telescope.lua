return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = { "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
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
            {
                "<leader>rp",
                function()
                    require("telescope.builtin").resume()
                end,
                desc = 'Resume Prior scope'
            },
        }
    },
}
