return {
  "mason-org/mason.nvim",
  "mason-org/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  opts = {
    setup = {
      require("mason").setup(),
      require("mason-lspconfig").setup({
        automatic_enable = {
          exclude = {
            "pyright",
          },
        },
      }),
      -- require("lspconfig").pyright.setup({
      --   autostart = false,
      -- }),
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
