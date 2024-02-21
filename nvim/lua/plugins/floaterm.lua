return {
  "voldikss/vim-floaterm",
  lazy = false,

  config = function()
    vim.g.floaterm_opener = "edit"
    vim.g.floaterm_titleposition = "right"
  end,

  keys = {
    { "<leader>fl", "<cmd>FloatermToggle<cr>", desc = "Toggle floaterm" },
    {
      "<leader>fa",
      "<cmd>FloatermNew! conda activate $(cat .conda-env)<cr>",
      desc = "Create a new terminal window with conda env",
    },
    {
      "<leader>fi",
      "<cmd>FloatermNew! --name=ipython conda activate $(cat .conda-env) && ipython<cr>",
      desc = "Create ipython console",
    },
    { "<leader>fs", "<cmd>FloatermSend! --name=ipython<cr>", desc = "Send current line to ipython" },
    { "<leader>fv", "<cmd>'<,'>FloatermSend! --name=ipython<cr>", desc = "Send current selection to ipython" },
    { "<leader>fw", "<cmd>%FloatermSend! --name=ipython<cr>", desc = "Send the whole buffer to ipython" },
  },
}
