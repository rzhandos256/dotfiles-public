return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs", -- Оставляем режим табов Neovim
				style_preset = {
					require("bufferline").style_preset.minimal,
					require("bufferline").style_preset.no_italic, -- Уберем курсив для чистоты
				},
				separator_style = "none", -- Убираем разделители, будем играть только на цвете фона
				show_buffer_icons = false, -- Выключаем иконки файлов для минимализма
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = false,
				tab_size = 18,
				always_show_bufferline = true,

				-- Цвета под Solarized Light
				highlights = {
					fill = { bg = "#eee8d5" }, -- Фон всей полосы (Base2)

					-- Неактивные табы
					tab = {
						fg = "#93a1a1",
						bg = "#eee8d5",
					},

					-- Активный таб (Сливается с фоном редактора #fdf6e3)
					tab_selected = {
						fg = "#586e75",
						bg = "#fdf6e3",
						bold = true,
					},

					-- Полоска-индикатор (сделаем её в цвет фона, чтобы не мешала)
					indicator_selected = {
						fg = "#fdf6e3",
						bg = "#fdf6e3",
					},
				},
			},
		})

		local map = vim.keymap.set
		-- В режиме tabs используем стандартные команды gt / gT, но вешаем их на Tab
		map("n", "<Tab>", "gt", { desc = "Next Tab" })
		map("n", "<S-Tab>", "gT", { desc = "Prev Tab" })

		-- Быстрое закрытие таба
		map("n", "<leader>x", "<cmd>tabclose<cr>", { desc = "Close Tab" })
		-- Создание нового таба
		map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
	end,
}
