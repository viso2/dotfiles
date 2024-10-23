-- Map leader
vim.g.mapleader = " "

-- telescope
vim.keymap.set("n", "<Leader>ff", require("telescope.builtin").find_files, { desc = "Telescope find files "})
vim.keymap.set("n", "<Leader>fg", require("telescope.builtin").live_grep, { desc = "Telescope find files "})

-- neo-tree
vim.keymap.set("n", "<Leader>e", "<Cmd>Neotree<CR>", { desc = "Enable Explorer"})
vim.keymap.set("n", "<Leader>o", ":lua FocusNeoTree()<CR>", { desc = "Changes the focus to/from neotree" })
vim.keymap.set("n", "<Leader>c", "<Cmd>Neotree close<CR>", { desc = "Close Explorer"})

function FocusNeoTree()
	local filetype = vim.bo.filetype

	if filetype == "neo-tree" then
		vim.cmd.wincmd "p"
	else
		vim.cmd.Neotree "focus"
	end
end

