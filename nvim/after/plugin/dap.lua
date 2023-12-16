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

--dap-keybind
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>dr", dap.repl.open)

local dapui = require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup({})
