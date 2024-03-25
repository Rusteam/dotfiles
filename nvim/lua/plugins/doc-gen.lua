return {
  "kkoomen/vim-doge",
  ft = "python",

  config = function()
    vim.g.doge_doc_standard_python = "google"
  end,

  keys = {
    {
      "<leader>DG",
      ":DogeGenerate<cr>",
      desc = "Generate documentation with vim-doge",
      mode = { "n", "v" },
      noremap = true,
    },
  },
}
