-- Neovim Tree
-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	version = "*",
-- 	lazy = false,
-- 	dependencies = {
-- 		"nvim-tree/nvim-web-devicons",
-- 	},
-- 	config = function()
-- 		require("nvim-tree").setup({
-- 			view = {
-- 				width = 30,
-- 				side = "left",
-- 				relativenumber = true,
-- 			},
-- 			filters = {
-- 				dotfiles = true,
-- 			},
-- 		})
-- 	end,
-- }

return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons", -- optional, but recommended
			"s1n7ax/nvim-window-picker",
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			filesystem = {
				filtered_items = {
					visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(arg)
						vim.cmd [[
          setlocal relativenumber
        ]]
					end,
				}
			},
			window = {
				width = 30,
			},
		}
	} }
