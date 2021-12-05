# NeoVim Settings

My neovim configrations

## Pre Required

### Language / Tools

- languages
  - golang
  - node
  - python
  - java
- tools
  - wget
  - graphviz

### Environment variables

| name         | value                                                                                                                                                                                                                                   |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| PYTHON3_PATH | used as [g:python3_host_prog](https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments). If you use asdf, set like below<br>`export PYTHON3_PATH=$(asdf where python)/bin/python` |

## Setup

```console
# install editor tools
./script/install.sh
```

Start neovim and install plugins with `:PlugInstall` !
