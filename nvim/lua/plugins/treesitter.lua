local help = require('lib/helpers')

vim.pack.add({
    help.gh("nvim-treesitter/nvim-treesitter"),
    { src = help.gh("nvim-treesitter/nvim-treesitter-textobjects"), version = "main" },
    help.gh("nvim-treesitter/nvim-treesitter-context"),
})

require('nvim-treesitter').install({
    "c", "lua", "vim", "vimdoc", "query"
})

require("treesitter-context").setup({
    enable = true,
    max_lines = 3
})

--         -- Disable entire built-in ftplugin mappings to avoid conflicts.
--         -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
vim.g.no_plugin_maps = true

require("nvim-treesitter-textobjects").setup({
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
})

vim.keymap.set({ "x", "o" },
    "af",
    function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end,
    { desc = "Outer Function" }
)

vim.keymap.set({ "x", "o" },
    "if",
    function()
        require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end,
    { desc = 'Inner Function' }
)

vim.keymap.set({ "x", "o" },
    "ac",
    function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end,
    { desc = 'Outer Class' }
)

vim.keymap.set({ "x", "o" },
    "ic",
    function()
        require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end,
    { desc = 'Inner Class' }
)
vim.keymap.set({ "x", "o" },
    "as",
    function()
        require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals")
    end,
    { desc = 'Local Scope' }
)
vim.keymap.set("n",
    "<leader>n",
    function()
        require "nvim-treesitter-textobjects.swap".swap_next("@parameter.inner")
    end,
    { desc = 'Swap Parameter Next' }
)

vim.keymap.set("n",
    "<leader>N",
    function()
        require "nvim-treesitter-textobjects.swap".swap_previous("@parameter.outer")
    end,
    { desc = 'Swap Parameter Before' }
)

vim.keymap.set({ "x", "o", "n" },
    "]m",
    function()
        require "nvim-treesitter-textobjects.move".goto_next_start("@function.outer", "textobjects")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "]]",
    function()
        require "nvim-treesitter-textobjects.move".goto_next_start("@class.outer", "textobjects")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "]o",
    function()
        require "nvim-treesitter-textobjects.move".goto_next_start({ "@loop.outer", "@loop.inner" },
            "textobjects")
    end
)
vim.keymap.set({ "x", "o", "n" },
    "]s",
    function()
        require "nvim-treesitter-textobjects.move".goto_next_start("@local.scope", "locals")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "]z",
    function()
        require "nvim-treesitter-textobjects.move".goto_next_start("@fold", "folds")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "]M",
    function()
        require "nvim-treesitter-textobjects.move".goto_next_end("@function.outer", "textobjects")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "][",
    function()
        require "nvim-treesitter-textobjects.move".goto_next_end("@class.outer", "textobjects")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "[m",
    function()
        require "nvim-treesitter-textobjects.move".goto_previous_start("@function.outer", "textobjects")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "[[",
    function()
        require "nvim-treesitter-textobjects.move".goto_previous_start("@class.outer", "textobjects")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "[M",
    function()
        require "nvim-treesitter-textobjects.move".goto_previous_end("@function.outer", "textobjects")
    end
)

vim.keymap.set({ "x", "o", "n" },
    "[]",
    function()
        require "nvim-treesitter-textobjects.move".goto_previous_end("@class.outer", "textobjects")
    end
)
