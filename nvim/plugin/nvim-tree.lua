local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
	return
end

vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	-- open_on_setup = false,
	-- open_on_setup_file = false,
	-- open_on_tab = false,
	-- disable_netrw = true,
	actions = {
		open_file = {
			window_picker = { enable = false },
		},
	},
})
