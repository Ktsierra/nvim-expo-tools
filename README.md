# nvim-expo-tools

A Neovim plugin that provides JSON schema completions for Expo projects, specifically for `app.json` and `eas.json` files.

This plugin leverages the built-in LSP client in Neovim and the `jsonls` language server to provide autocompletion and validation based on the official Expo schemas.

## Installation

Install this plugin using your favorite plugin manager. The recommended way is to add it as a dependency to `nvim-lspconfig`.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
-- In your lspconfig setup file
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- other dependencies...
    'Ktsierra/nvim-expo-tools',
  },
  config = function()
    -- your lspconfig setup...
    local servers = {
      jsonls = {
        settings = {
          json = {
            schemas = require('expo-tools').schemas
          }
        }
      },
      -- other servers...
    }

    -- your handler to setup servers...
  end
}
```

## Usage

Once installed and configured as a dependency for `nvim-lspconfig`, this plugin will automatically provide the Expo schemas to the `jsonls` language server.

Here's a more complete example of how to merge the schemas within your `lspconfig` setup, ensuring any other schemas you have are preserved:

```lua
-- inside your lspconfig config function

local servers = {
  jsonls = {
    settings = {
      json = {
        -- your other schemas can go here
        schemas = {}
      }
    }
  },
  -- other servers...
}

-- Add the expo schemas
local expo_schemas = require('expo-tools').schemas
for _, schema in ipairs(expo_schemas) do
  table.insert(servers.jsonls.settings.json.schemas, schema)
end

-- in your lspconfig setup loop
require('lspconfig')['jsonls'].setup(servers.jsonls)
```

## How it works

This plugin simply provides a Lua table containing the official JSON schemas from the Expo repositories. You can then merge this table into your `jsonls` language server configuration.
