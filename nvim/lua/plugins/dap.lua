return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                dependencies = {
                    "nvim-neotest/nvim-nio"
                }
            },
            -- virtual text for the debugger
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },
        },
        config = function()
            local dap = require("dap")
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

            local dapui = require("dapui")

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
