-- Configurações de mapeamento com o Which Key
return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			-- Git signs
			local gs = package.loaded.gitsigns
			require("which-key").setup({
				window = {
					border = "double",
					position = "top",
				},
			})

			-- Chamada do plugin para normal
			local wk_normal = require("which-key")
			wk_normal.register({
				["<leader>"] = {
					["<leader>"] = { "i", "Insert mode" },
					["<space>"] = { "za", "Toggle fold" },
					Q = { ":q<cr>", "Close neovim" },
					l = { "A", "Insert mode (end)" },
					w = { ":w<cr>", "Write file" },
					a = { "ggVG", "Select all" },
					q = { ":bd<cr>", "Close buffer" },
					m = { ":marks<cr>", "Marks list" },
					n = { "*", "Next occurrence of word" },
					N = { "#", "Previous occurrence of word" },
					f = {
						f = { ":Telescope file_browser path=%:p:h select_buffer=true<CR>", "Find files" },
						b = { require("telescope.builtin").buffers, "Find existing buffers" },
						o = { require("telescope.builtin").oldfiles, "Find recently opened files" },
					},
					s = {
						s = {
							function()
								require("telescope.builtin").current_buffer_fuzzy_find({
									previewer = true,
								})
							end,
							"Search in current buffer",
						},
						g = { require("telescope.builtin").git_files, "Search git files" },
						f = { require("telescope.builtin").find_files, "Search files" },
						h = { require("telescope.builtin").help_tags, "Search help" },
						w = { require("telescope.builtin").grep_string, "Search current word" },
						l = { require("telescope.builtin").live_grep, "Search by grep" },
						d = { require("telescope.builtin").diagnostics, "Search diagnostics" },
						r = { require("telescope.builtin").resume, "Search resume" },
						b = {
							function()
								require("telescope.builtin").live_grep({
									grep_open_files = true,
									prompt_title = "Live Grep in Open Files",
								})
							end,
							"Search in open buffers",
						},
						e = { ":LiveGrepGitRoot<cr>", "Search grep in git root" },
						S = { require("telescope.builtin").lsp_document_symbols, "Search document symbols" },
						k = { require("telescope.builtin").lsp_dynamic_workspace_symbols, "Search workspace symbols" },
					},
					G = {
						s = { gs.stage_hunk, "git stage hunk" },
						r = { gs.reset_hunk, "git reset hunk" },
						S = { gs.stage_buffer, "git stage buffer" },
						u = { gs.undo_stage_hunk, "undo stage hunk" },
						R = { gs.reset_buffer, "git reset buffer" },
						p = { gs.preview_hunk, "preview git hunk" },
						b = {
							function()
								gs.blame_line({ full = false })
							end,
							"Git blame line",
						},
						d = { gs.diffthis, "Git diff against index" },
						D = {
							function()
								gs.diffthis("~")
							end,
							"Git diff against last commit",
						},
						t = { gs.toggle_current_line_blame, "Toggle git blame line" },
						T = { gs.toggle_deleted, "Toggle git show deleted" },
					},
					r = {
						n = { vim.lsp.buf.rename, "Rename" },
					},
					c = {
						a = { vim.lsp.buf.code_action, "Code Action" },
					},
				},
				g = {
					d = { require("telescope.builtin").lsp_definitions, "Goto definitions (telescope)" },
					r = { require("telescope.builtin").lsp_references, "Goto references(telescope)" },
					i = { require("telescope.builtin").lsp_implementations, "Goto implementations (telescope)" },
					t = { require("telescope.builtin").lsp_type_definitions, "Goto type definitions" },
					D = { vim.lsp.buf.declaration, "Goto declaration" },
				},
				K = { vim.lsp.buf.hover, "Hover documentation" },
				["]c"] = {
					function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end,
					"Jump to next hunk",
				},
				["[c"] = {
					function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end,
					"Jump to previous hunk",
				},
				["<C-k>"] = { vim.lsp.buf.signature_help, "Signature documentation" },
				["<A-n>"] = { ":bn<cr>", "Buffer next" },
				["<A-p>"] = { ":bp<cr>", "Buffer previous" },
				["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
				["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
				["-"] = { "<CMD>Oil<CR>", "Open parent directory" },
				["<A-1>"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Buffer 1" },
				["<A-2>"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "Buffer 2" },
				["<A-3>"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "Buffer 3" },
				["<A-4>"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "Buffer 4" },
				["<A-5>"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "Buffer 5" },
				["<A-6>"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "Buffer 6" },
				["<A-7>"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "Buffer 7" },
				["<A-8>"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "Buffer 8" },
				["<A-9>"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "Buffer 9" },
			}, { mode = "n", noremap = true })

			-- Mapeamentos para insert
			local wk_insert = require("which-key")
			wk_insert.register({
				["<leader>"] = {
					["<leader>"] = { "<esc>", "Normal mode" },
					l = { "<esc>A", "End of line" },
				},
			}, { mode = "i", noremap = true })

			-- Mapeamentos para visual
			local wk_visual = require("which-key")
			wk_visual.register({
				["<leader>"] = {
					["<leader>"] = { "<esc>", "Normal mode" },
					G = {
						s = {
							function()
								gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
							end,
							"Git stage hunk",
						},
						r = {
							function()
								gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
							end,
							"Git reset hunk",
						},
					},
				},
				["<C-j"] = { "<CMD>MoveBlock(1)<CR>", "Move line up" },
				["<C-k"] = { "<CMD>MoveBlock(-1)<CR>", "Move line down" },
			}, { mode = "v", noremap = true })
		end,
	},
}
