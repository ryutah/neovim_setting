OS_VERSION=$(cat /etc/os-release | grep 'VERSION_ID' | sed -E 's/VERSION_ID="(.+)"/\1/g')
CLANG_LLVM_VERSION=12.0.0
TERRAFORM_LSP_VERSION=0.19.1
