return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapgo = require("dap-go")
		dapui.setup()
		dapgo.setup()
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
			"<Leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "[dap] toggle breakpoint",
		},
		{
			"<Leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "[dap] continue",
		},
	},
}
