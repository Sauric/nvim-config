local opts = {
  default_format_opts = {
    timeout_ms = 3000,
    async = false, -- not recommended to change
    quiet = false, -- not recommended to change
    lsp_format = "fallback", -- not recommended to change
  },

  formatters_by_ft = {
    lua = { "stylua" },
    fish = { "fish_indent" },
    sh = { "shfmt" },
    cs = { "csharpier" },
    csproj = { "csharpier_sauric" },
  },

  formatters = {
    injected = { options = { ignore_errors = true } },
    csharpier_sauric = {
      command = "csharpier",
      args = {
        "format",
        "--write-stdout",
      },
      to_stdin = true,
    },
  },
}

require("conform").format(opts)
return {}
