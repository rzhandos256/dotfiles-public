return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("cokeline").setup({
			-- Вместо несуществующего show_if_buffers_at_least
			-- используем стандартные настройки сетапа

			default_hl = {
				fg = function(buffer)
					return buffer.is_focused and "#586e75" or "#93a1a1"
				end,
				bg = function(buffer)
					return buffer.is_focused and "#fdf6e3" or "#eee8d5"
				end,
				bold = function(buffer)
					return buffer.is_focused
				end,
			},

			sidebar = {
				filetype = "neo-tree",
				components = {
					{
						text = "  EXPLORER",
						fg = "#93a1a1",
						bg = "#eee8d5",
						bold = true,
					},
				},
			},

			components = {
				{
					text = " ",
					bg = function(buffer)
						return buffer.is_focused and "#fdf6e3" or "#eee8d5"
					end,
				},
				{
					text = function(buffer)
						return buffer.unique_prefix .. buffer.filename
					end,
				},
				{
					text = function(buffer)
						return buffer.is_modified and " *" or ""
					end,
					fg = "#cb4b16",
				},
				{
					text = "  ",
					bg = function(buffer)
						return buffer.is_focused and "#fdf6e3" or "#eee8d5"
					end,
				},
			},
		})

		local map = vim.keymap.set
		map("n", "<Tab>", "<Plug>(cokeline-focus-next)", { silent = true })
		map("n", "<S-Tab>", "<Plug>(cokeline-focus-prev)", { silent = true })

		-- Чтобы буфер не "зависал" и Neo-tree не ломался:
		map("n", "<leader>x", function()
			-- Если есть bufdelete.nvim, лучше :Bdelete
			-- Если нет, этот хак сохранит твой layout:
			local bufnr = vim.api.nvim_get_current_buf()
			vim.cmd("bp")
			vim.cmd("bd" .. bufnr)
		end, { silent = true, desc = "Close buffer safely" })
	end,
}
