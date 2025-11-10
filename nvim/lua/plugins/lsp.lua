return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pylsp = false,
        pyright = {
          settings = {
            pyright = {
              autoImportCompletion = true,
            },
            python = {
              analysis = {
                autoImportCompletions = true,
              },
            },
          },
        },
      },
    },
  },
}
