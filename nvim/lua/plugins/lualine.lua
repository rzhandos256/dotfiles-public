return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "solarized_light", -- Автоматически подстроится под твою тему
				component_separators = { left = "│", right = "│" },
				section_separators = { left = "", right = "" }, -- Без лишних треугольников, чистый flat стиль
				globalstatus = true, -- Один статусбар на все сплиты (как в tmux)
				disabled_filetypes = { statusline = { "neo-tree", "TelescopePrompt" } },
			},
			sections = {
				lualine_a = { {
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				} }, -- Только первая буква (N, I, V) — меньше мусора
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } }, -- path = 1 показывает относительный путь (удобно в больших проектах)
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
