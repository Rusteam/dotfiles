return {
  "voldikss/vim-floaterm",
  lazy = false,

  config = function()
    vim.g.floaterm_opener = "edit"
    vim.g.floaterm_titleposition = "right"
  end,

  keys = {
    { "<leader>zf", "<cmd>FloatermToggle<cr>", desc = "Toggle floaterm" },
    { "<leader>zi", "<cmd>FloatermNew! --name=ipython ipython<cr>", desc = "Create a new ipython terminal" },
    { "<leader>zl", "<cmd>FloatermSend! --name=ipython<cr>", desc = "Send current line to ipython" },
    { "<leader>zv", "<cmd>'<,'>FloatermSend! --name=ipython<cr>", desc = "Send current selection to ipython" },
    { "<leader>zb", "<cmd>%FloatermSend! --name=ipython<cr>", desc = "Send the whole buffer to ipython" },
  },
}
