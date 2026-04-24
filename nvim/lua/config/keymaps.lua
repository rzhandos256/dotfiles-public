local map = vim.keymap.set

map("n", "<Space>", ":noh<CR>", { silent = true })
map("i", "jk", "<Esc>", { silent = true })
map("n", ";", ":", { silent = true })
map("n", "Y", "%y", { silent = true })
map("n", "<leader>n", ":tabnew ", { silent = true })
map("n", "<leader>w", ":w<CR>", { silent = true })
map("n", "<leader>q", ":q<CR>", { silent = true })
map("n", "<leader>x", ":x<CR>", { silent = true })
map("n", "<leader>cn", [[:%s/\<<C-r><C-w>\>/]], { desc = "Search and replace word under cursor" })
