-- Configurações do treesitter
-- return {
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		dependencies = {
-- 			"nvim-treesitter/nvim-treesitter-textobjects",
-- 		},
-- 		branch = "main",
-- 		build = ":TSUpdate",
-- 		config = function()
-- 			vim.defer_fn(function()
-- 				require("nvim-treesitter.configs").setup({
-- 					-- Linguagens instaladas
-- 					ensure_installed = {
-- 						"c",
-- 						"cpp",
-- 						"go",
-- 						"lua",
-- 						"python",
-- 						"rust",
-- 						"tsx",
-- 						"javascript",
-- 						"typescript",
-- 						"vimdoc",
-- 						"vim",
-- 						"bash",
-- 						"elixir",
-- 					},
-- 					auto_install = true,
-- 					highlight = { enable = true },
-- 					indent = { enable = true },
-- 					incremental_selection = {
-- 						enable = true,
-- 						keymaps = {
-- 							init_selection = "<c-space>",
-- 							node_incremental = "<c-space>",
-- 							scope_incremental = "<c-s>",
-- 							node_decremental = "<M-space>",
-- 						},
-- 					},
-- 					textobjects = {
-- 						select = {
-- 							enable = true,
-- 							lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
-- 							keymaps = {
-- 								-- You can use the capture groups defined in textobjects.scm
-- 								["aa"] = "@parameter.outer",
-- 								["ia"] = "@parameter.inner",
-- 								["af"] = "@function.outer",
-- 								["if"] = "@function.inner",
-- 								["ac"] = "@class.outer",
-- 								["ic"] = "@class.inner",
-- 							},
-- 						},
-- 						move = {
-- 							enable = true,
-- 							set_jumps = true, -- whether to set jumps in the jumplist
-- 							goto_next_start = {
-- 								["]m"] = "@function.outer",
-- 								["]]"] = "@class.outer",
-- 							},
-- 							goto_next_end = {
-- 								["]M"] = "@function.outer",
-- 								["]["] = "@class.outer",
-- 							},
-- 							goto_previous_start = {
-- 								["[m"] = "@function.outer",
-- 								["[["] = "@class.outer",
-- 							},
-- 							goto_previous_end = {
-- 								["[M"] = "@function.outer",
-- 								["[]"] = "@class.outer",
-- 							},
-- 						},
-- 						swap = {
-- 							enable = true,
-- 							swap_next = {
-- 								["<leader>AN"] = "@parameter.inner",
-- 							},
-- 							swap_previous = {
-- 								["<leader>AP"] = "@parameter.inner",
-- 							},
-- 						},
-- 					},
-- 				})
-- 			end, 0)
-- 		end,
-- 	},
-- }
--
-- Configurações do treesitter
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local parsers = {
				"c", "cpp", "go", "lua", "python", "rust",
				"tsx", "javascript", "typescript",
				"vimdoc", "vim", "bash", "elixir",
				"markdown", "markdown_inline",
			}

			require("nvim-treesitter").install(parsers)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = parsers,
				callback = function(args)
					vim.treesitter.start(args.buf)
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

					-- workaround bug conceal_lines no markdown (Neovim 0.12)
					if vim.bo[args.buf].filetype == "markdown" then
						vim.wo[0][0].conceallevel = 0
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true,
					keymaps = {
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
				move = {
					set_jumps = true,
					goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
					goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
					goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
					goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
				},
				swap = {
					swap_next = { ["<leader>AN"] = "@parameter.inner" },
					swap_previous = { ["<leader>AP"] = "@parameter.inner" },
				},
			})
		end,
	},
}
