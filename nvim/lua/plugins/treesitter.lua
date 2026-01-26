return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
            -- Disable entire built-in ftplugin mappings to avoid conflicts.
            -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
            vim.g.no_plugin_maps = true

            -- Or, disable per filetype (add as you like)
            -- vim.g.no_python_maps = true
            -- vim.g.no_ruby_maps = true
            -- vim.g.no_rust_maps = true
            -- vim.g.no_go_maps = true
        end,
        opts = {
            select = {
                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
                -- You can choose the select mode (default is charwise 'v')
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'V', or '<c-v>') or a table
                -- mapping query_strings to modes.
                selection_modes = {
                    ['@parameter.outer'] = 'v', -- charwise
                    ['@function.outer'] = 'V',  -- linewise
                    -- ['@class.outer'] = '<c-v>', -- blockwise
                },
                -- If you set this to `true` (default is `false`) then any textobject is
                -- extended to include preceding or succeeding whitespace. Succeeding
                -- whitespace has priority in order to act similarly to eg the built-in
                -- `ap`.
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * selection_mode: eg 'v'
                -- and should return true of false
                include_surrounding_whitespace = false,
            },
        },
        keys = {
            {
                "af",
                function()
                    require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
                end,
                mode = { "x", "o" },
                desc = 'Outer Function'
            },
            {
                "if",
                function()
                    require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
                end,
                mode = { "x", "o" },
                desc = 'Inner Function'
            },
            {
                "ac",
                function()
                    require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
                end,
                mode = { "x", "o" },
                desc = 'Outer Class'
            },
            {
                "ic",
                function()
                    require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
                end,
                mode = { "x", "o" },
                desc = 'Inner Class'
            },
            {
                "as",
                function()
                    require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
                end,
                mode = { "x", "o" },
                desc = 'Local Scope'
            },
            {
                "<leader>n",
                function()
                    require "nvim-treesitter-textobjects.swap".swap_next("@parameter.inner")
                end,
                desc = 'Swap Parameter Next'
            },
            {
                "<leader>N",
                function()
                    require "nvim-treesitter-textobjects.swap".swap_previous("@parameter.outer")
                end,
                desc = 'Swap Parameter Before'
            },
        }
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            enable = true,
            max_lines = 3
        }
    }
}
