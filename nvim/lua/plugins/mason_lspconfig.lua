return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({ automatic_installation = {
      exclude = { "pyright" },
    } })
  end,
}
