
local M = {}

function M.setup()
  require('lspconfig').jsonls.setup {
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { 'app.json', 'app.config.json' },
            url = 'https://raw.githubusercontent.com/expo/vscode-expo/main/schemas/expo-xdl.json',
          },
          {
            fileMatch = { 'eas.json' },
            url = 'https://raw.githubusercontent.com/expo/eas-cli/main/packages/eas-json/schema/eas.schema.json',
          },
        },
      },
    },
  }
end

return M
