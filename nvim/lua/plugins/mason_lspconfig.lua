return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  opts = {
    setup = {
      require("mason").setup(),
      require("mason-lspconfig").setup(),
      require("lspconfig").pyright.setup({
        autostart = false,
      }),
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              rope_autoimport = {
                enabled = true,
              },
            },
          },
        },
      }),
    },
  },
}
