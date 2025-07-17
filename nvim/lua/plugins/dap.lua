return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            local mason_dap = require("mason-nvim-dap")
            local dap = require("dap")
            local dapui = require("dapui")
            local dap_virtual_text = require("nvim-dap-virtual-text")

            -- Dap Virtual Text
            dap_virtual_text.setup({})

            mason_dap.setup({
                handlers = {
                    function(config)
                        require("mason-nvim-dap").default_setup(config)
                    end,
                },
            })
            -- local dap_virtual_text = require("nvim-dap-virtual-text")
            -- dap_virtual_text.enable()jk

            -- debug-config
            dap.adapters.coreclr = {
                type = "executable",
                command = "/usr/bin/netcoredbg",
                args = { "--interpreter=vscode" },
            }

            -- Need netcoredbg installed
            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input({
                            prompt = "Patch to dll: ",
                            default = vim.fn.getcwd() .. "/bin/Debug",
                            completion = "file",
                        })
                    end,
                },
            }

            dap.configurations.go = {
                {
                    type = "delve",
                    name = "Debug",
                    request = "launch",
                    program = "${file}",
                },
                {
                    type = "delve",
                    name = "Debug test", -- configuration for debugging test files
                    request = "launch",
                    mode = "test",
                    program = "${file}",
                },
                -- works with go.mod packages and sub packages
                {
                    type = "delve",
                    name = "Debug test (go.mod)",
                    request = "launch",
                    mode = "test",
                    program = "./${relativeFileDirname}",
                },
            }

            dap.configurations.typescript = {
                {
                    name = 'Debug with Firefox',
                    type = 'firefox',
                    request = 'launch',
                    reAttach = true,
                    url = 'http://localhost:3000',
                    webRoot = '${workspaceFolder}',
                    firefoxExecutable = '/usr/bin/firefox'
                }
            }


            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end

            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end

            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
        keys = {
            {
                "<F5>",
                function()
                    require("dap").continue()
                end
            },
            {
                "<F10>",
                function()
                    require("dap").step_over()
                end
            },
            {
                "<F11>",
                function()
                    require("dap").step_into()
                end
            },
            {
                "<F12>",
                function()
                    require("dap").step_out()
                end
            },
            {
                "<leader>b",
                function()
                    require("dap").toggle_breakpoint()
                end
            },
            {
                "<leader>dr",
                function()
                    require("dap").repl.open()
                end
            },
        }
    }
}
