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

## Other Configurations

### Golang Remote Debug Config

For debug remote golang app (like docker container application), change some configs for project.

```sh
# port number for dlv debugger.
export GO_DELVE_PORT=38697
# absolute path of project root path on remote server.
export GO_SUBSTITUTE_PATH=/app
```

## Tips

### .luarc.json

adds below config to your `.luarc.json` to disable annoying diagnostics.

```json
{
  "diagnostics.disable": ["missing-fields"]
}
```
