return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"lua_ls",
					"cmake",
                    "pyright"
				},
				automatic_installation = true,
			})
		end
	}
}
