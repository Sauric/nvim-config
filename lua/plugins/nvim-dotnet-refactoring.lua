return {
  {
    "Sauric/nvim-dotnet-refactoring",
    ft = "cs",
    opts = {},
    keys = {
      { "<leader>cR", "<cmd>DotnetRename<cr>", ft = "cs", desc = "Rename C# symbol (+ file)" },
      { "<leader>cE", "<cmd>DotnetExtractToPartial<cr>", ft = "cs", desc = "Extract C# member to partial" },
      { "<leader>cx", "<cmd>DotnetExtractClass<cr>", ft = "cs", desc = "Extract C# type(s) to own file(s)" },
    },
  },
}
