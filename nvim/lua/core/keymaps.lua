local opts = {noremap = true, silent = true}


vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {desc = "Copy currently selected to clipboard"})
vim.keymap.set("n", "<leader>Y", [["+Y]], {desc = "Copy to clipboard"})

vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)


-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", opts)


--Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>a", ":Bdelete<CR>", {desc = "Close Buffer", noremap = true, silent = true})
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", {desc = "New Buffer", noremap = true, silent = true})


-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", {desc = "Split Vertically"})
vim.keymap.set("n", "<leader>h", "<C-w>s", {desc = "Split Horizontally"})
vim.keymap.set("n", "<leader>se", "<C-w>=", {desc = "Equalize Splits"})
vim.keymap.set("n", "<leader>xs", ":close<CR>", {desc = "Close Split"})


-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)


-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts)
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts)
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts)



vim.keymap.set("n", "<leader>qp", ":QuartoPreview<CR>", {noremap = true, silent = true, desc = "Quarto Preview"})
vim.keymap.set("n", "<leader>rc", ":QuartoSend",  { desc = "Run Block", silent = true })
