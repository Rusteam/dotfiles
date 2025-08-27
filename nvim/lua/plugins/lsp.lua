return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = false,
        pylsp = {
          settings = {
            pylsp = {
              plugins = {
                rope_autoimport = {
                  enabled = true,
                  memory = true,
                  completions = { enabled = true },
                  code_actions = { enabled = true },
                },
              },
            },
          },
        },
      },
    },
  },
}
