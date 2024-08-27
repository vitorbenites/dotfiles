-- Configurações do telescope
return {
	-- Telescope: Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		config = function()
			-- Configuração do Telescope
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			require("telescope").setup({
				defaults = {
					layout_strategy = "horizontal",
					layout_config = {
						mirror = false,
						horizontal = {
							prompt_position = "top",
							preview_cutoff = 0,
						},
						vertical = {
							prompt_position = "top",
							preview_cutoff = 0,
						},
					},
					sorting_strategy = "ascending",
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
						n = {
							["q"] = actions.close,
							["h"] = fb_actions.goto_parent_dir,
							["l"] = actions.select_default,
							["H"] = fb_actions.toggle_hidden,
						},
					},
				},
				pickers = {
					find_files = {
						hidden = true,
					},
					buffers = {
						initial_mode = "normal",
					},
					diagnostics = {
						initial_mode = "normal",
					},
					lsp_definitions = {
						initial_mode = "normal",
					},
				},
				extensions = {
					file_browser = {
						hijack_netrw = false,
						initial_mode = "normal",
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "media_files")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("remote-sshfs")
		end,
	},

	-- File Browser Telescope
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
}
