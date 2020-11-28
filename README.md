# NeoVim Settings

My neovim config

## Pre Required

### Install [vim-plug](https://github.com/junegunn/vim-plug)

```console
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Set Python3 PATH

```console
export PYTHON3_PATH="<PYTHON3_INSTALL_PATH>"
```

references [here](https://github.com/deoplete-plugins/deoplete-jedi/wiki/Setting-up-Python-for-Neovim#using-virtual-environments)

## Usage

### Install

```console
./script/initialize.sh
```

### Update

```console
./script/update.sh
```
