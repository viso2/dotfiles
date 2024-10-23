local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true})

-- Map leader
vim.g.mapleader = " "

-- telescope
vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files, { desc = "Telescope find files "})
vim.keymap.set("n", "<Leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope find files "})

-- neo-tree
vim.keymap.set("n", "<Leader>e", "<Cmd>Neotree<CR>", { desc = "Enable Explorer"})
vim.keymap.set("n", "<Leader>o", ":lua FocusNeoTree()<CR>", { desc = "Changes the focus to/from neotree" })
vim.keymap.set("n", "<Leader>c", "<Cmd>Neotree close<CR>", { desc = "Close Explorer"})

-- toggle-term
vim.keymap.set("n", "<Leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Open floating terminal"})
vim.keymap.set("n", "<Leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { desc = "Open horisontal terminal"})
vim.keymap.set("n", "<Leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { desc = "Open vertical terminal"})
vim.keymap.set("n", "<Leader>tl", ":lua LazygitToggle()<CR>", { desc = "Opens lazygit terminal"})

-- lsp
vim.keymap.set("n", "gd", ":lua JmpToDecl()", {desc = "Jump to declaration"})
vim.keymap.set("n", "gD", ":lua JmpToDefi()", {desc = "Jump to definition"})
vim.keymap.set("n", "gI", ":lua JmpToImpl()", {desc = "Jump to implementation"})
vim.keymap.set("n", "<Leader>lr", ":lua rename()", {desc = "Rename current symbol"})

function rename() vim.lsp.buf.rename() end
function JmpToImpl() vim.lsp.buf.implementation() end
function JmpToDecl() vim.lsp.buf.declaration() end
function JmpToDefi() vim.lsp.buf.definition() end
function LazygitToggle() lazygit:toggle() end

function FocusNeoTree()
	local filetype = vim.bo.filetype

	if filetype == "neo-tree" then
		vim.cmd.wincmd "p"
	else
		vim.cmd.Neotree "focus"
	end
end

