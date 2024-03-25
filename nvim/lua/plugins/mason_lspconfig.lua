return {
  -- "williamboman/mason.nvim",
  -- "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      pylsp = {
        plugins = {
          rope_autoimport = {
            enabled = true,
          },
        },
      },
    },
  },
}
