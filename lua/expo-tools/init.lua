local M = {}

M.schemas = {
  {
    fileMatch = { "app.json", "app.config.json" },
    url = "https://raw.githubusercontent.com/expo/vscode-expo/main/schemas/expo-xdl.json",
  },
  {
    fileMatch = { "eas.json" },
    url = "https://raw.githubusercontent.com/expo/eas-cli/main/packages/eas-json/schema/eas.schema.json",
  },
}

function M.setup(opts)
  local lspconfig = require "lspconfig"
  if not lspconfig then
    vim.notify("nvim-lspconfig not found!", vim.log.levels.WARN)
    return
  end

  opts = opts or {}

  local schemas = vim.list_extend(vim.deepcopy(M.schemas), opts.schemas or {})

  lspconfig.jsonls.setup {
    settings = {
      json = {
        schemas = schemas,
      },
    },
  }
end

return M