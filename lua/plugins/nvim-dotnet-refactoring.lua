return {
  {
    dir  = vim.fn.expand("~/Development/ai-projects/nvim-dotnet-refactoring"),
    name = "nvim-dotnet-refactoring",
    ft   = "cs",
    opts = {},
    keys = {
      { "<leader>cR", "<cmd>DotnetRename<cr>",           ft = "cs", desc = "Rename C# symbol (+ file)" },
      { "<leader>cE", "<cmd>DotnetExtractToPartial<cr>", ft = "cs", desc = "Extract C# member to partial" },
    },
  },
}
