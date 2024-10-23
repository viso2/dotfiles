require("config.lazy")
require("config.keymaps")
require("config.nvim-cmp")
require("config.heirline")
require("config.bufferline")
require("config.gitsigns")

vim.cmd.colorscheme "catppuccin"
vim.opt.termguicolors = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.wrap = false
