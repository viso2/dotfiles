require("config.lazy")
require("config.keymaps")
require("config.nvim-cmp")
require("config.heirline")

vim.cmd.colorscheme "catppuccin"
vim.opt.termguicolors = true
require("bufferline").setup{}
