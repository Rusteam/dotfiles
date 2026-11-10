return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      local save_dir = vim.fn.expand("~/.local/share/db_ui")
      local tmp_dir = vim.fn.stdpath("data") .. "/db_ui_tmp"
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_save_location = save_dir
      -- default tmp dir dies with nvim, so session-restored query buffers come back empty and detached
      vim.g.db_ui_tmp_query_location = tmp_dir

      -- session restore loads query buffers as plain files: re-attach so run-on-save and :w name work
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { tmp_dir .. "/*", save_dir .. "/*/*" },
        callback = function()
          if not vim.b.dbui_db_key_name then
            vim.schedule(function() vim.cmd("DBUIFindBuffer") end)
          end
        end,
      })

      -- `:w name` in a DBUI query buffer saves it to Saved queries; bare `:w` keeps default behavior
      vim.api.nvim_create_user_command("DBUISave", function(o)
        if o.args == "" then
          return vim.cmd.write({ bang = o.bang })
        end
        local db_name = vim.b.dbui_db_key_name:gsub("_[^_]+$", "")
        local path = save_dir .. "/" .. db_name .. "/" .. o.args
        if vim.uv.fs_stat(path) and not o.bang then
          return vim.notify("Saved query exists: " .. o.args .. " (:w! to overwrite)", vim.log.levels.ERROR)
        end
        vim.fn.mkdir(vim.fs.dirname(path), "p")
        vim.cmd.write({ args = { path }, bang = true })
        vim.cmd.edit({ args = { path } })
      end, { nargs = "?", bang = true })
      vim.cmd([[cnoreabbrev <expr> w (getcmdtype() ==# ':' && getcmdline() ==# 'w' && exists('b:dbui_db_key_name')) ? 'DBUISave' : 'w']])
    end,
  },

  -- Register dadbod completion as a blink.cmp source for SQL buffers.
  -- Without this, table/column completion never fires inside DBUI queries.
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        per_filetype = {
          sql = { "dadbod" },
          mysql = { "dadbod" },
          plsql = { "dadbod" },
        },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
  },
}
