return {
	-- 1. Основа: Рисуем все линии отступов
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local hooks = require("ibl.hooks")

			-- Создаем цвета, которые ТОЧНО видны в Solarized Light
			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#eee8d5" }) -- Базовые линии (очень тусклые)
			vim.api.nvim_set_hl(0, "IblScope", { fg = "#93a1a1", bold = true }) -- Активный блок (заметный)

			require("ibl").setup({
				indent = {
					char = "╎", -- Пунктирная линия для базы
					highlight = "IblIndent",
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = false,
					highlight = "IblScope",
				},
				exclude = {
					filetypes = { "help", "neo-tree", "lazy", "mason", "notify" },
				},
			})
		end,
	},

	-- 2. Стероиды: Анимированная линия, которая "летает" за курсором
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			symbol = "┃", -- Жирная сплошная линия для активного блока
			options = {
				try_as_border = true,
				border = "both",
			},
			-- Анимация (сделаем её быстрее для 100wpm)
			draw = {
				delay = 0,
				animation = function(s, n)
					return 10
				end, -- очень быстрая отрисовка
			},
		},
		config = function(_, opts)
			-- Устанавливаем цвет для mini.indentscope, чтобы он гармонировал с темой
			vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#268bd2" }) -- Синий акцент Solarized
			require("mini.indentscope").setup(opts)
		end,
	},
}
