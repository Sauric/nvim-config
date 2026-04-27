return {
  {
    "mfussenegger/nvim-dap",
    optional = false,
    -- Use init (not config) so adapter setup always runs regardless of which
    -- spec's config= wins (LazyVim dap.core extra also defines config=).
    init = function()
      -- Defer until after nvim-dap is loaded
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        once = true,
        callback = function()
          local ok, dap = pcall(require, "dap")
          if not ok then return end

          local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
          local netcoredbg_adapter = {
            type = "executable",
            command = mason_path,
            args = { "--interpreter=vscode" },
          }

          dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
          dap.adapters.coreclr = netcoredbg_adapter    -- needed for unit test debugging

          -- Launch configurations (easy-dotnet will extend cs with its attach config)
          for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
            if not dap.configurations[lang] then
              dap.configurations[lang] = {
                {
                  type = "netcoredbg",
                  name = "Launch .NET (select DLL)",
                  request = "launch",
                  program = function()
                    return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
                  end,
                  cwd = "${workspaceFolder}",
                },
              }
            end
          end
        end,
      })
    end,
  },
}
