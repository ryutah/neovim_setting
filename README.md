# NeoVim Settings

My neovim configrations

## Pre Required

### Language / Tools

- languages
  - golang
  - node
  - python
- tools
  - graphviz

## Setup

### In terminal

```console
./script/setup.sh
```

### In neovim

```vim
:PackerSync
:UpdateTools
:Copilot setup
```

## Tips

### .luarc.json

adds below config to your `.luarc.json` to disable annoying diagnostics.

```json
{
  "diagnostics.disable": ["missing-fields"]
}
```
