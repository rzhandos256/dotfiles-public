return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter")

		configs.setup({
			-- Список языков, которые установятся сразу
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"zsh",
				"bash",
				"dockerfile",
				"yaml",
				"json",
				"c",
			},

			-- Автоматическая установка языков, если открываешь файл, которого нет в списке выше
			auto_install = true,

			highlight = {
				enable = true, -- Включаем саму подсветку
				additional_vim_regex_highlighting = false,
			},

			-- Умные отступы на основе структуры кода
			indent = { enable = true },

			-- Бонус: выделение блоков кода (incremental selection)
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss", -- start selection
					node_incremental = "<leader>si", -- increment to node
					scope_incremental = "<leader>sc", -- increment to scope
					node_decremental = "<leader>sd", -- decrement selection
				},
			},
		})
	end,
}
