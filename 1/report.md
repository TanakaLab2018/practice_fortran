# Gitをインストールしてみましょう

## windowsへのインストール

以下のサイトを参考にしてみてください

[コマンドラインからGitを使う(for Windows)](https://qiita.com/taiponrock/items/632c117220e57d555099P)

## Macへのインストール
参考サイト: [HomebrewでGitをインストールする](https://qiita.com/micheleno13/items/133aee005ae37c28960e)

### 前提条件
Homebrewがインストールされていること

次のコマンドをTerminalに入力してみてください

`
  brew install git
`

# Gitを使うための準備をしましょう

* まずatomを開いて, 左上のファイルから「プロジェクトフォルダを追加」を選んで, 好きな名前でフォルダを作ってください.

* Terminal や コマンドプロンプト (いつもプログラムをコンパイルする所)を開きましょう.

* つづいて, 次のように入力してみてください.

> ` git clone https://github.com/TanakaLab2018/practice_fortran.git`

* そうすると, 'practice_fortran'というフォルダが出来上がると思うので, 次のコマンドを入力してください.

> ` cd practice_fortran `

* つづいて, 適当でいいので次のコマンドを打ちます.

> ` git config --global user.name "<自分のニックネーム>"`

> `git config --global user.email <aaa@bbb.c(適当でも通ります笑)>`

これからは, このフォルダでいろいろやっていく予定です.

# 実際の作業をしてみましょう

以下の作業は最初はよくわからなくて大丈夫ですので, なんとなく従ってやってみてください.

* ディレクトリを移動します.

> ` cd 1`

* branchを切ってみます

> ` git checkout -b <自分のニックネーム>`

* ここで, '1'というフォルダのなかに'hello.f90'という名前で, 'hello, world.'を出力するプログラムを作りましょう.

* 作ったプログラムをいつも通りコンパイルしてみてください.

* 次に, 以下のコマンドを連続して入力してください.

> ` git add .`

> ` git commit -m "<好きなコメント(本当になんでもok!)>"`

> ` git push origin <自分のニックネーム>`

以上で終了です.

# サイトで確認してみよう

先程, `push`というコマンドを打ちましたが, このおかげで[このサイト](https://github.com/TanakaLab2018/practice_fortran.git)に先程作ったファイルが反映されていたら成功です!
