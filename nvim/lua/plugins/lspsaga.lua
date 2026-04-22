return {
	"nvimdev/lspsaga.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({
			ui = {
				border = "rounded",
				code_action = "💡",
			},
			-- Настройки клавиш внутри окон Саги
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			-- Принудительно ставим q на закрытие во всех типах окон
			finder = {
				keys = {
					quit = "q",
				},
			},
			definition = {
				keys = {
					quit = "q",
				},
			},
			diagnostic = {
				keys = {
					quit = "q",
				},
			},
			rename = {
				keys = {
					quit = "q",
				},
			},
			outline = {
				keys = {
					quit = "q",
				},
			},
			hover = {
				open_link = "gx",
				open_cmd = "!open",
			},
			symbol_in_winbar = { enable = true },
			lightbulb = { enable = false },
		})

		local map = vim.keymap.set

		-- === БИНДЫ БЕЗ ЛИДЕРА ===
		map("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
		map("n", "gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition" })
		map("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
		map("n", "gh", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" })
		map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })

		-- === БИНДЫ С ЛИДЕРОМ ===
		map("n", "<leader>fq", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "File Diagnostics" })
		map({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action" })
		map("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Rename" })
		map("n", "<leader>lo", "<cmd>Lspsaga outline<CR>", { desc = "Outline" })

		-- Навигация по диагностике
		map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
		map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })
	end,
}
