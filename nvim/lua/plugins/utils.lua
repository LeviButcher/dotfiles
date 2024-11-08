return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        opt = {},
        keys = {
            {
                "<leader>a",
                function()
                    require("harpoon"):list():add()
                end,
                desc = "Add (Harpoon)"
            },
            {
                "<C-e>",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "Menu (Harpoon)"
            },
            {
                "<C-h>",
                function() require("harpoon"):list():select(1) end,
                desc = "Select #1 (Harpoon)"
            },
            {
                "<C-t>",
                function() require("harpoon"):list():select(2) end,
                desc = "Select #2 (Harpoon)"
            },
            {
                "<C-n>",
                function() require("harpoon"):list():select(3) end,
                desc = "Select #3 (Harpoon)"
            },
            {
                "<C-s>",
                function() require("harpoon"):list():select(4) end,
                desc = "Select #4 (Harpoon)"
            },
            {
                "<C-S-P>",
                function() require("harpoon"):list():prev() end,
                desc = "Select Prev (Harpoon)"
            },
            {
                "<C-S-N>",
                function() require("harpoon"):list():next() end,
                desc = "Select Next (Harpoon)"
            },
        },
    },
    {
        "echasnovski/mini.comment",
        version = false,
        opt = {},
        event = "VeryLazy",
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "sindrets/diffview.nvim",        -- optional - Diff integration
            "nvim-telescope/telescope.nvim", -- optional
        },
        config = true,
        keys = {
            {
                "<leader>gs",
                function()
                    require("neogit").open()
                end,
                desc = "Open (Neogit)"
            },
        },
        opt = {}
    },
    {
        "FabijanZulj/blame.nvim",
        config = function()
            require("blame").setup()
        end
    },
}
