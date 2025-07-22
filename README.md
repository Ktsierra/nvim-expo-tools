# nvim-expo-tools

A Neovim plugin that provides JSON schema completions for Expo projects, specifically for `app.json` and `eas.json` files.

This plugin leverages the built-in LSP client in Neovim and the `jsonls` language server to provide autocompletion and validation based on the official Expo schemas.

## Installation

You can install this plugin using your favorite plugin manager.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "Ktsierra/nvim-expo-tools",
  dependencies = { "neovim/nvim-lspconfig" },
}
```

## Usage

This plugin exports a table of JSON schemas that you can merge into your `jsonls` configuration.

Here's an example of how to merge the schemas in your `lspconfig` setup:

```lua
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

-- in your lspconfig setup loop
require('lspconfig')['jsonls'].setup(servers.jsonls)
```

Ensure you have `nvim-lspconfig` and the `jsonls` language server installed and configured.

## How it works

This plugin fetches the official JSON schemas from the Expo repositories and provides them as a Lua table that you can easily merge into your `jsonls` language server configuration.