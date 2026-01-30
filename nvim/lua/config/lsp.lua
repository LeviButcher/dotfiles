local help = require('lib/helpers')

vim.pack.add({
    help.gh("neovim/nvim-lspconfig"),
})

vim.opt.signcolumn = 'yes'

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
        if client then
            if client:supports_method('textDocument/implementation') then
                -- Create a keymap for vim.lsp.buf.implementation ...
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
                vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
                vim.keymap.set('n', '<leader>.', '<cmd>lua vim.lsp.buf.code_action()<cr>')
            end
            -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
            if client:supports_method('textDocument/completion') then
                -- Optional: trigger autocompletion on EVERY keypress. May be slow!
                -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
                -- client.server_capabilities.completionProvider.triggerCharacters = chars
                vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
                vim.keymap.set('i', '<c-space>', function()
                    vim.lsp.completion.get()
                end)
            end

            -- Inlay hints
            if client:supports_method("textDocument/inlayHint") then
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end

            if client:supports_method("textDocument/documentColor") then
                vim.lsp.document_color.enable(true, args.buf, {
                    style = "background", -- 'background', 'foreground', or 'virtual'
                })
            end


            -- Disabling in favor of Guard.nvim
            -- Auto-format ("lint") on save.
            -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
            -- if not client:supports_method('textDocument/willSaveWaitUntil')
            --     and client:supports_method('textDocument/formatting') then
            --     vim.api.nvim_create_autocmd('BufWritePre', {
            --         group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
            --         buffer = args.buf,
            --         callback = function()
            --             vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
            --         end,
            --     })
            -- end
        end
    end,
})


vim.lsp.enable({
    "lua_ls",
    "ts_ls",
    "rnix",
    "csharp_ls",
    "eslint"
})


-- treesitter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        local filetype = vim.bo.filetype
        if filetype and filetype ~= "" then
            pcall(vim.treesitter.start)
        end
    end,
})
