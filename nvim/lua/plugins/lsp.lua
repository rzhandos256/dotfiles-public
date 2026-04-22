return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = { "lua_ls", "pyright", "bashls", "dockerls" },
				automatic_enable = true,
			},
		},
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local servers = { "lua_ls", "pyright", "bashls", "dockerls" }

		-- Только инициализация и включение серверов
		for _, server in ipairs(servers) do
			vim.lsp.config(server, { capabilities = capabilities })
			vim.lsp.enable(server)
		end
	end,
}
