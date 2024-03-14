return {
  "kkoomen/vim-doge",
  ft = "python",

  config = function()
    vim.g.doge_mapping = "<leader>DG"
    vim.g.doge_doc_standard_python = "google"
  end,
}
