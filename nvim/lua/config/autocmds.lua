-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- .env files are detected as `dosini` (see config/options.lua); make sure they
-- are never autoformatted or auto-wrapped.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dosini",
  callback = function(args)
    vim.b[args.buf].autoformat = false
    vim.bo[args.buf].textwidth = 0
    vim.bo[args.buf].formatoptions = vim.bo[args.buf].formatoptions:gsub("[tc]", "")
  end,
})
