return {
  "mfussenegger/nvim-dap-python",
  -- stylua: ignore
  keys = {
    { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method", ft = "python" },
    { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class", ft = "python" },
  },
  config = function()
    local path = require("mason-registry").get_package("debugpy"):get_install_path()
    require("dap-python").setup(path .. "/Users/rustem.galiullin/.conda/envs/sar-detection/bin/python")
  end,
}
