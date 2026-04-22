return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<Right>", -- Меняем на C-f (Forward), чтобы не конфликтовать с Tab в nvim-cmp
				clear_suggestion = "<C-]>",
				accept_word = "<C-j>",
			},
			ignore_filetypes = { cpp = true },
			color = {
				suggestion_color = "#FFB8B8", -- Серый цвет приятнее для глаз, чем чисто белый
				cterm = 244,
			},
			log_level = "off", -- Для 10x продуктивности логи не нужны, лишний I/O
			disable_inline_completion = false,
			disable_keymaps = false,
			-- Убрал функцию condition, если ты хочешь, чтобы он работал везде.
		})
	end,
}
