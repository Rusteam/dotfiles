return {
  "python-rope/ropevim",
  ft = "python",

  config = function()
    vim.g.rope_autoimport_enabled = true
  end,
}
