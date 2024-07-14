return {
	{
		"Exafunction/codeium.vim",
		-- enabled = false,
	},
	{
		"huggingface/llm.nvim",
		enabled = false,
		opts = {
			backend = "ollama",
			model = "codellama:7b-code",
			-- model = "stable-code",

			-- model = "tinyllama",
			-- url = "http://10.0.0.23:11434/api/generate",
			url = "http://127.0.0.1:11434/api/generate",
			request_body = {
				-- keep_alive = -1,
				-- 	-- Modelfile options for the model you use
				options = {
					--[[ 					keep_alive = 1, ]]
					-- num_ctx = 1024,
					temperature = 0.2,
					top_p = 0.95,
				},
			},
			-- codellama params
			--
			tokens_to_clear = { "<EOT>" },
			fim = {
				enabled = true,
				-- prefix = "<FIM_PREFIX>",
				-- suffix = "<FIM_SUFFIX>",
				prefix = "<PRE> ",
				middle = " <MID>",
				suffix = " <SUF>",
			},
			-- context_window = 4096,
			tokenizer = nil,
			--    {
			-- 	repository = "codellama/CodeLlama-13b-hf",
			-- },
		},
	},
}
