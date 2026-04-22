local function clean_sidebar()
	-- Делаем колонку знаков (ошибки, гит, LSP) полностью прозрачной
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

	-- Убираем фон у самих значков ошибок и предупреждений
	vim.api.nvim_set_hl(0, "DiagnosticSignError", { bg = "NONE", fg = "#dc322f" })
	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { bg = "NONE", fg = "#b58900" })
	vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { bg = "NONE", fg = "#268bd2" })
	vim.api.nvim_set_hl(0, "DiagnosticSignHint", { bg = "NONE", fg = "#2aa198" })

	-- Если используешь Gitsigns, убираем фон и у них
	vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = "NONE", fg = "#859900" })
	vim.api.nvim_set_hl(0, "GitSignsChange", { bg = "NONE", fg = "#b58900" })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = "NONE", fg = "#dc322f" })
end

-- Запуск
clean_sidebar()

-- Чтобы настройки не слетели при смене темы
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = clean_sidebar,
})

-- Функция для сброса фона номеров строк
local function fix_colors()
	-- Убираем фон у номеров строк
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#93a1a1", bg = "NONE" })
	-- Убираем фон у текущего номера строки
	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#586e75", bg = "NONE", bold = true })
	-- Убираем фон у колонки знаков (где гит и ошибки)
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
	-- Делаем плавающие окна (как Lspsaga) тоже без тяжелого фона, если нужно
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
end

-- Запускаем сразу и при каждой смене темы
fix_colors()
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = fix_colors,
})
