-- Configurações do leap
return {
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
			-- Mapeamento bidirecional
			vim.keymap.set({ "n", "x", "o" }, "s", function()
				local current_window = vim.fn.win_getid()
				require("leap").leap({ target_windows = { current_window } })
			end)
			require("leap").opts.safe_labels = "1234567890"
			require("leap").opts.labels = "1234567890"
		end,
	},
}
