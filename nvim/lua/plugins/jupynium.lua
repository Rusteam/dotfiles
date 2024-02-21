return {

  {
    "kiyoon/jupynium.nvim",
    lazy = true,
    -- build = "pip3 install --user .",
    build = "conda run --no-capture-output -n jupynium pip install .",
    -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),

    config = function()
      require("jupynium").setup({
        python_host = { "conda", "run", "--no-capture-output", "-n", "jupynium", "python" },
      })
    end,
  },
  "rcarriga/nvim-notify", -- optional
  "stevearc/dressing.nvim", -- optional, UI for :JupyniumKernelSelect
}
