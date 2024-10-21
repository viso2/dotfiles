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
			})
		end
	}
}
