-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.title = false

-- nvim detects .env files as filetype `sh`, which makes shfmt / sh formatting
-- split any unquoted line containing `;` onto multiple lines (`;` is a shell
-- statement separator). Map them to `dosini` instead: no shell formatting, and
-- it gives distinct key (dosiniLabel) / value (dosiniValue) / comment
-- highlighting. Registered here so it wins the filetype race at startup.
vim.filetype.add({
  filename = {
    [".env"] = "dosini",
  },
  pattern = {
    ["%.env%.[%w_.-]+"] = "dosini", -- .env.local, .env.production, etc.
    [".*%.env"] = "dosini", -- foo.env, anabot.env, etc.
  },
})
