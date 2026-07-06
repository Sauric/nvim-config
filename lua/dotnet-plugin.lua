vim.pack.add({"https://github.com/GustavEikaas/easy-dotnet.nvim"})
-- Define the helper function
local function has_dotnet_project()
    local patterns = { "*.sln", "*.csproj", "*.cs", "*.slx" }
    for _, pattern in ipairs(patterns) do
        if #vim.fn.glob(pattern) > 0 then
            return true
        end
    end
    return false
end

-- Setup with filetype detection + validation
require("easy-dotnet").setup({
    ft = "cs",
    on_attach = function(client, bufnr)
        local cwd = vim.fn.getcwd()
        local current_file = vim.api.nvim_buf_get_name(0)
    
        print("=== eazy-dotnet ===")
        vim.notify("Working directory: " .. cwd)
        print("Current file: " .. current_file)
        print("Project detected: " .. tostring(has_dotnet_project()))
        if not has_dotnet_project() then
            vim.notify("No .NET project found", vim.log.levels.WARN)
            -- Optionally detach the client
            client.detach()
        end
    end,
})
