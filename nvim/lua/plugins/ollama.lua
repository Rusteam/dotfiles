return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },

    -- Sample keybind for direct prompting. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oG",
      ":<c-u>lua require('ollama').prompt('Generate_Code')<cr>",
      desc = "ollama Generate Code",
      mode = { "n", "v" },
    },
  },

  opts = {
    -- your configuration overrides
    model = "llama3.1",
    prompts = {
      Readme_Selection = {
        prompt = "Generate readme-style docs for the following code:\n\n```$ftype\n$sel```"
          .. "\n\nUtilize markdown featues such as headers, list items, code highlighting, etc. "
          .. "for it to look pretty and well-structured. Try to be brief and omit trivial aspects.",
        action = "display",
      },
      Readme_Buffer = {
        prompt = "Generate readme-style docs for the following code:\n\n```$ftype\n$buf```"
          .. "\n\nUtilize markdown featues such as headers, list items, code highlighting, etc. "
          .. "for it to look pretty and well-structured. Try to be brief and omit trivial aspects.",
        action = "display",
      },
      Docstring = {
        prompt = "Generate a concise docstring in the google docstring format:\n\n```$ftype\n$sel```."
          .. "\n\nSimply return the docstring itself inside triple quotes without any other comment.",
        action = "display",
      },
    },
  },
}
