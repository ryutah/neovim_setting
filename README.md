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
#### javascriptなどのインデント崩れ
eclimをデフォルトのまま使用すると、javascript、htmlのインデントがぶっ壊れるので、`indent`, `syntax` などにある `javascript` , `html` , `xml` , `css` の名前のもつファイルを削除するか名称を変更する必要あり。
#### カラー設定
Syntax highlightの設定は、多分[javaid.vim](http://nanasi.jp/articles/vim/javaid_vim.html)を使ってるっぽいので、カラー設定はそこを参照
