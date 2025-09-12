return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		require("nvim-tree").setup({
            view = {
                width = 35,
            },
            update_focused_file = {
                enable = true,
            }
		})
		vim.keymap.set("n", "<leader>nt", ":NvimTreeToggle<CR>", {desc = "Nvim-tree" })
	end,
}
