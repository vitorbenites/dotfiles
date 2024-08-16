-- Configurações de mapeamento com o Which Key
return {
	{
		"folke/which-key.nvim",
		dependencies = { "echasnovski/mini.icons", version = false },
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			-- Git signs
			local gs = package.loaded.gitsigns
			require("which-key").setup({
				win = {
					border = "double",
					-- position = "top",
				},
			})

			-- Chamada do plugin para normal
			local wk = require("which-key")
			wk.add({
				mode = { "n" },
				{ "<leader><leader>", "i", desc = "Insert mode" },
				{ "<leader><space>", "za", desc = "Toggle fold" },
				{ "<leader>Q", ":q<cr>", desc = "Close neovim" },
				{ "<leader>l", "A", desc = "Insert mode (end)" },
				{ "<leader>w", ":w<cr>", desc = "Write file" },
				{ "<leader>a", "ggVG", desc = "Select all" },
				{ "<leader>q", ":Bdelete<cr>", desc = "Close buffer" },
				{ "<leader>m", ":marks<cr>", desc = "Marks list" },
				{ "<leader>n", "*", desc = "Next occurrence of word" },
				{ "<leader>N", "#", desc = "Previous occurrence of word" },
				-- Leader f
				{ "<leader>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "Find files" },
				{ "<leader>fb", require("telescope.builtin").buffers, desc = "Find existing buffers" },
				{ "<leader>fo", require("telescope.builtin").oldfiles, desc = "Find recently opened files" },
				-- Leader s
				{
					"<leader>sS",
					function()
						require("telescope.builtin").current_buffer_fuzzy_find({
							previewer = true,
						})
					end,
					desc = "Search in current buffer",
				},
				{ "<leader>sg", require("telescope.builtin").git_files, desc = "Search git files" },
				{ "<leader>sf", require("telescope.builtin").find_files, desc = "Search files" },
				{ "<leader>sh", require("telescope.builtin").help_tags, desc = "Search help" },
				{ "<leader>sw", require("telescope.builtin").grep_string, desc = "Search current word" },
				{ "<leader>sl", require("telescope.builtin").live_grep, desc = "Search by grep" },
				{ "<leader>sd", require("telescope.builtin").diagnostics, desc = "Search diagnostics" },
				{ "<leader>sr", require("telescope.builtin").resume, desc = "Search resume" },
				{
					"<leader>sb",
					function()
						require("telescope.builtin").live_grep({
							grep_open_files = true,
							prompt_title = "Live Grep in Open Files",
						})
					end,
					desc = "Search in open buffers",
				},
				{ "<leader>se", ":LiveGrepGitRoot<cr>", desc = "Search grep in git root" },
				{ "<leader>sk", require("telescope.builtin").lsp_document_symbols, desc = "Search document symbols" },
				{
					"<leader>ss",
					require("telescope.builtin").lsp_dynamic_workspace_symbols,
					desc = "Search workspace symbols",
				},
				-- Leader G
				{ "<leader>Gs", gs.stage_hunk, desc = "git stage hunk" },
				{ "<leader>Gr", gs.reset_hunk, desc = "git reset hunk" },
				{ "<leader>GS", gs.stage_buffer, desc = "git stage buffer" },
				{ "<leader>Gu", gs.undo_stage_hunk, desc = "undo stage hunk" },
				{ "<leader>GR", gs.reset_buffer, desc = "git reset buffer" },
				{ "<leader>Gp", gs.preview_hunk, desc = "preview git hunk" },
				{
					"<leader>Gb",
					function()
						gs.blame_line({ full = false })
					end,
					desc = "Git blame line",
				},
				{ "<leader>Gd", gs.diffthis, desc = "Git diff against index" },
				{
					"<leader>GD",
					function()
						gs.diffthis("~")
					end,
					desc = "Git diff against last commit",
				},
				{ "<leader>Gt", gs.toggle_current_line_blame, desc = "Toggle git blame line" },
				{ "<leader>GT", gs.toggle_deleted, desc = "Toggle git show deleted" },
				-- Leader rn
				{ "<leader>rn", vim.lsp.buf.rename, desc = "Symbol rename" },
				{ "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
				{ "<leader>t", ":NvimTreeToggle<CR>", desc = "Neovim Tree Toggle" },
				-- Tecla G
				{ "gd", require("telescope.builtin").lsp_definitions, desc = "Goto definitions (telescope)" },
				{ "gr", require("telescope.builtin").lsp_references, desc = "Goto references(telescope)" },
				{ "gi", require("telescope.builtin").lsp_implementations, desc = "Goto implementations (telescope)" },
				{ "gt", require("telescope.builtin").lsp_type_definitions, desc = "Goto type definitions" },
				{ "gD", vim.lsp.buf.declaration, desc = "Goto declaration" },
				-- Tecla K
				{ "K", vim.lsp.buf.hover, desc = "Hover documentation" },
				-- Diff
				{
					"]c",
					function()
						if vim.wo.diff then
							return "]c"
						end
						vim.schedule(function()
							gs.next_hunk()
						end)
						return "<Ignore>"
					end,
					desc = "Jump to next hunk",
				},
				{
					"[c",
					function()
						if vim.wo.diff then
							return "[c"
						end
						vim.schedule(function()
							gs.prev_hunk()
						end)
						return "<Ignore>"
					end,
					desc = "Jump to previous hunk",
				},
				{ "<C-k>", vim.lsp.buf.signature_help, desc = "Signature documentation" },
				{ "<A-n>", ":bn<cr>", desc = "Buffer next" },
				{ "<A-p>", ":bp<cr>", desc = "Buffer previous" },
				{ "[d", vim.diagnostic.goto_prev, desc = "Previous diagnostic" },
				{ "]d", vim.diagnostic.goto_next, desc = "Next diagnostic" },
				{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
				{ "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Buffer 1" },
				{ "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Buffer 2" },
				{ "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Buffer 3" },
				{ "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Buffer 4" },
				{ "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Buffer 5" },
				{ "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Buffer 6" },
				{ "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Buffer 7" },
				{ "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Buffer 8" },
				{ "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Buffer 9" },
			})

			wk.add({
				mode = { "i", "v" },
				{ "<leader><leader>", "<esc>", desc = "Normal mode" },
				{ "<leader>l", "A", desc = "Insert mode (end)" },
			})

			wk.add({
				mode = { "v" },
				{
					"<leader>Gs",
					function()
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					desc = "Git stage hunk",
				},
				{
					"<leader>Gr",
					function()
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end,
					desc = "Git reset hunk",
				},
				{ "<C-j", "<CMD>MoveBlock(1)<CR>", desc = "Move line up" },
				{ "<C-k", "<CMD>MoveBlock(-1)<CR>", desc = "Move line down" },
			})
		end,
	},
}
