return {'akinsho/bufferline.nvim',
	version = "*",
	dependencies = 'nvim-tree/nvim-web-devicons',
	config = function ()
		vim.opts.termguicolors = true,
		require("bufferline").setup{}
	end
}
