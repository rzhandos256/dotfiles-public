return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	-- Убираем cmd = "Neotree", чтобы плагин мог загрузиться при открытии папки
	init = function()
		-- Выключаем стандартный netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Биндим <leader>e на toggle в режиме float
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle float<CR>", { silent = true })
	end,
	opts = {
		window = {
			position = "float", -- Основной режим — плавающий
			width = 40,
			popup_strategy = "FP",
			mapping_options = {
				noremap = true,
				nowait = true,
			},
			mappings = {
				["<space>"] = "none",
				["e"] = "close_window",
				["q"] = "close_window", -- Добавил q для консистентности с Сагой
			},
		},
		filesystem = {
			-- Это заставляет Neo-tree открываться вместо пустой страницы
			hijack_netrw_behavior = "open_default",
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,
			},
			use_libuv_file_watcher = true,
		},
		-- Добавим немного эстетики для Solarized Light
		default_component_configs = {
			indent = {
				with_expanders = true, -- добавляет стрелочки
				expander_collapsed = "",
				expander_expanded = "",
			},
		},
	},
}
