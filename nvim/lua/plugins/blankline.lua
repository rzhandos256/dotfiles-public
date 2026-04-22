return {
	-- 1. Основа: Рисуем статические линии отступов
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local hooks = require("ibl.hooks")

			-- Цвет для обычных линий (Base2 — очень тусклый)
			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#eee8d5" })

			require("ibl").setup({
				indent = {
					char = "╎", -- Пунктирная линия
					highlight = "IblIndent",
				},
				scope = {
					-- Выключаем scope в IBL, так как за него теперь отвечает mini.indentscope
					enabled = false,
				},
				exclude = {
					filetypes = { "help", "neo-tree", "lazy", "mason", "notify" },
				},
			})
		end,
	},

	-- 2. Стероиды: Мгновенная линия активного блока (БЕЗ анимации)
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			symbol = "┃", -- Жирная сплошная линия
			options = {
				try_as_border = true,
			},
			draw = {
				-- Полностью убираем задержки для 100wpm
				delay = 0,
				animation = function(s, n)
					return 0 -- 0 означает мгновенную отрисовку всего блока
				end,
			},
		},
		config = function(_, opts)
			-- Синий акцент для активного блока (Base16 Blue)
			vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#268bd2", bold = true })
			require("mini.indentscope").setup(opts)
		end,
	},
}
