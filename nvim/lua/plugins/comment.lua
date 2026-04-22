return {
	"numToStr/Comment.nvim",
	opts = {
		-- Настройки по умолчанию обычно работают,
		-- но давай пропишем бинды явно для надежности
		toggler = {
			line = "gcc", -- стандарт
		},
		pleader = {
			line = "gc",
		},
	},
	config = function(_, opts)
		require("Comment").setup(opts)

		local map = vim.keymap.set
		-- Тот самый фикс для Ctrl + /
		map("n", "<C-_>", "gcc", { remap = true })
		map("v", "<C-_>", "gc", { remap = true })

		-- На некоторых клавиатурах/терминалах может приходить как <C-/>
		map("n", "<C-/>", "gcc", { remap = true })
		map("v", "<C-/>", "gc", { remap = true })
	end,
}
