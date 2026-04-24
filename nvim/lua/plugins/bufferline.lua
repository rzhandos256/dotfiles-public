return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })
		require("bufferline").setup({
			options = {
				mode = "tabs",
				always_show_bufferline = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = false, -- выключаем цветные иконки для минимализма
				-- 'thin' или просто отсутствие стиля уберет косые линии (slant)
				separator_style = { "", "" },
				indicator = { style = "none" },
				padding = 1,
			},
			highlights = {
				fill = {
					bg = "#fdf6e3",
				},
				-- Неактивные вкладки (тусклые)
				background = {
					fg = "#93a1a1", -- Solarized Base1
					bg = "#fdf6e3",
				},
				buffer_visible = {
					fg = "#93a1a1",
					bg = "#fdf6e3",
				},
				-- Активная вкладка (темная и четкая)
				buffer_selected = {
					fg = "#2d434a", -- Solarized Base01 (глубокий темный)
					bg = "#fdf6e3",
					bold = true,
					italic = false,
				},
				-- Настройки для вкладок (Tabs mode)
				tab = {
					fg = "#93a1a1",
					bg = "#fdf6e3",
				},
				tab_selected = {
					fg = "#2d434a",
					bg = "#fdf6e3",
					bold = true,
				},
				-- Убираем лишние детали
				separator = { fg = "#fdf6e3", bg = "#fdf6e3" },
				separator_selected = { fg = "#fdf6e3", bg = "#fdf6e3" },
				indicator_selected = { fg = "#fdf6e3", bg = "#fdf6e3" },
				modified = { fg = "#93a1a1", bg = "#fdf6e3" },
				modified_selected = { fg = "#2d434a", bg = "#fdf6e3" },
			},
		})
	end,
}
