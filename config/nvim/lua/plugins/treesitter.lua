return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {"c", "cpp"},
				highlight = { enable = true },
				indent = { enable = true },
                fold = { enable = true},
			})

            vim.opt.foldmethod = "expr"
            vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
            vim.opt.foldenable = false
            vim.opt.foldlevel = 1
		end
	}
}
