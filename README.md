# nvim-expo-tools

A Neovim plugin that provides JSON schema completions for Expo projects, specifically for `app.json` and `eas.json` files.

This plugin leverages the built-in LSP client in Neovim and the `jsonls` language server to provide autocompletion and validation based on the official Expo schemas.

## Installation

You can install this plugin using your favorite plugin manager.

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "ktsierra/nvim-expo-tools",
  -- Make sure jsonls is set up.
  -- This plugin just adds the schemas to the existing jsonls configuration.
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("expo-tools").setup()
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "ktsierra/nvim-expo-tools",
  requires = { "neovim/nvim-lspconfig" },
  config = function()
    require("expo-tools").setup()
  end,
}
```

## Usage

Once installed, this plugin will automatically configure the `jsonls` language server to recognize `app.json`, `app.config.json`, and `eas.json` files and provide schema-based completions and validation.

Ensure you have `nvim-lspconfig` and the `jsonls` language server installed and configured.

## How it works

This plugin fetches the official JSON schemas from the Expo repositories and registers them with the `jsonls` language server for the corresponding file patterns.
