-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- zen mode
vim.api.nvim_set_keymap("n", "<leader>zn", ":ZenMode<cr>", { noremap = true, silent = true })

-- moving lines
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Map Ctrl+/ to toggle floaterm
vim.api.nvim_set_keymap("n", "<C-/>", "<Cmd>FloatermToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-n>", "<Cmd>FloatermNext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-p>", "<Cmd>FloatermPrev<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<Cmd>FloatermKill<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-a>", "<Cmd>:FloatermNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "t",
  "<C-e>",
  "<C-\\><C-n>:FloatermNew! conda activate $(cat .conda-env)<cr>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "t",
  "<C-y>",
  "<C-\\><C-n>:FloatermNew! conda activate $(cat .conda-env) && ipython<cr>",
  { noremap = true, silent = true }
)
