local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>w", ":w<CR>", vim.tbl_extend("force", opts, { desc = "Save" }))
map("n", "<leader>q", ":q<CR>", vim.tbl_extend("force", opts, { desc = "Quit" }))
map("n", "<leader>Q", ":q!<CR>", vim.tbl_extend("force", opts, { desc = "Force quit" }))
map("n", "<leader>t", ":NvimTreeToggle<CR>", vim.tbl_extend("force", opts, { desc = "Toggle file tree" }))
map("n", "<leader>m", ":Mason<CR>", vim.tbl_extend("force", opts, { desc = "Open Mason" }))
map("n", "<leader>l", ":Lazy<CR>", vim.tbl_extend("force", opts, { desc = "Open Lazy" }))
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", vim.tbl_extend("force", opts, { desc = "Find files" }))
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", vim.tbl_extend("force", opts, { desc = "Live grep" }))
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", vim.tbl_extend("force", opts, { desc = "Buffers" }))
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", vim.tbl_extend("force", opts, { desc = "Help tags" }))
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-l>", "<C-w>l", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
