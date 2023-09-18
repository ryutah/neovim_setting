#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

# nvim app info
wd=$(pwd)
app_name=${NVIM_APPNAME:-nvim}
configs_dir=$(realpath ./configs)

# paths
config_path=${XDG_CONFIG_HOME:-$HOME/.config}
data_path=${XDG_DATA_HOME:-$HOME/.local/share}
bin_path=${data_path}/${app_name}/bin

echo "create symbolic link for nvim"
ln -sf ${wd} ${config_path}/${app_name}

echo "create symbolic link for tool configs"

# create symlink to home directory
ls -A ${configs_dir}/home | xargs -I{} ln -sf ${configs_dir}/home/{} ${HOME}/{}

# create symlink to config (xdg config) directory
ls -A ${configs_dir}/xdg_home | xargs -I{} ln -sf ${configs_dir}/xdg_home/{} ${config_path}/{}
