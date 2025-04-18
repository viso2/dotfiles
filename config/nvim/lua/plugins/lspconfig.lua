return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			local on_attach = function(client, bufnr)
				local bufopts = { noremap=true, silent=true, buffer=bufnr }
        			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        			vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			end

			lspconfig.clangd.setup {
				on_attach = on_attach,
				cmd = { "clangd", "--background-index", "--clang-tidy", "--cross-file-rename", "--suggest-missing-includes", "--all-scopes-completion" },
                root_dir = require("lspconfig").util.root_pattern(".git"),
				settings = {
					clangd = {
						compilationDatabasePath = "build",
					},
				},
			}
			lspconfig.lua_ls.setup { on_attach = on_attach }
			lspconfig.cmake.setup { on_attach = on_attach }
            lspconfig.pyright.setup { on_attach = on_attach }
            lspconfig.rust_analyzer.setup { on_attach = on_attach}
            lspconfig.asm_lsp.setup {on_attach = on_attach}
		end
	}
}
