OS_VERSION=$(cat /etc/os-release | grep 'VERSION_ID' | sed -E 's/VERSION_ID="(.+)"/\1/g')
TERRAFORM_LSP_VERSION=0.31.1
PLANT_UML_VERSION=1.2023.6
