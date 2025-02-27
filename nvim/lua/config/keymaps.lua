-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- copy filepath
vim.api.nvim_set_keymap(
  "n",
  "<leader>or",
  ":let @+=expand('%:~:.')<CR>",
  { noremap = true, silent = true, desc = "Copy content relative filepath" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>of",
  ":let @+=expand('%:p')<CR>",
  { noremap = true, silent = true, desc = "Copy absolute filepath" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>on",
  ":let @+=expand('%:t')<CR>",
  { noremap = true, silent = true, desc = "Copy filename" }
)

-- zen mode
vim.api.nvim_set_keymap("n", "<leader>zn", ":ZenMode<cr>", { noremap = true, silent = true })

-- moving lines
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })

-- Map Ctrl+/ to toggle floaterm
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.api.nvim_set_keymap("n", "<C-/>", "<Cmd>FloatermToggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-n>", "<Cmd>FloatermNext<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-p>", "<Cmd>FloatermPrev<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<Cmd>FloatermKill<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<C-t>", "<Cmd>FloatermNew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(
  "t",
  "<C-y>",
  "<Cmd>FloatermNew! --name=ipython ipython <cr>",
  { noremap = true, silent = true }
)
