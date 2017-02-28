# NeoVim Settings
## Init
- npm install -g tern
- gem install rcodetools
- gem install fastri
- Install "dein.vim"

## Install dein
See [dein.vim](https://github.com/Shougo/dein.vim)

## Caution
### eclim
eclimをデフォルトのまま使用すると、javascript、htmlのインデントがぶっ壊れる。

そのため、 `indent`, `syntax` などにある `javascript` , `html` , `xml` , `css` の名前のもつファイル
を削除するか名称を変更する必要あり。
