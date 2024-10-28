return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.opt.signcolumn = 'yes'

            -- Add cmp_nvim_lsp capabilities settings to lspconfig
            -- This should be executed before you configure any language server
            local lspconfig_defaults = require('lspconfig').util.default_config
            lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                'force',
                lspconfig_defaults.capabilities,
                require('cmp_nvim_lsp').default_capabilities()
            )

            -- This is where you enable features that only work
            -- if there is a language server active in the file
            vim.api.nvim_create_autocmd('LspAttach', {
                desc = 'LSP actions',
                callback = function(event)
                    local opts = { buffer = event.buf }

                    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
                end,
            })
        end,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp'
        }
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "luvit-meta/library", words = { "vim%.uv" } },
            },
        },
    },
    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    {                                        -- optional completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            opts.sources = opts.sources or {}
            table.insert(opts.sources, {
                name = "lazydev",
                group_index = 0, -- set group index to 0 to skip loading LuaLS completions
            })
        end,
        dependencies = { 'hrsh7th/cmp-nvim-lsp', 'neovim/nvim-lspconfig', "f3fora/cmp-spell" },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'spell' },
                },
                snippet = {
                    expand = function(args)
                        -- You need Neovim v0.10 to use vim.snippet
                        vim.snippet.expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
            })
        end
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
            }
        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },
    -- Not working at this time
    -- {
    --     "Decodetalkers/csharpls-extended-lsp.nvim",
    --     ft = "cs",
    --     init = function()
    --         require("lspconfig").csharp_ls.setup({
    --             handlers = {
    --                 ["textDocument/definition"] = require("csharpls_extended").handler,
    --                 ["textDocument/typeDefinition"] = require("csharpls_extended").handler
    --             }
    --         })
    --     end,
    --     dependencies = {
    --         "neovim/nvim-lspconfig",
    --     }
    -- },
}
