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

# Gitのパッケージをいれてみましょう

AtomにはGitを簡単に使えるようにするための**Git-Plus** というパッケージが存在しています.

ファイル→環境設定→インストールと移動して, 入力フォームに

```
git-plus
```

と入れてみてください. すると, ```git-plus```というパッケージがでてくるので, インストールしましょう.

インストールが完了したら, 一旦atomを閉じてもう一度開いてください.

* Windowsだと```Ctrl+Shift+H```
* Macだと```Cmd+Shift+H```

を押して, 変なウインドウが出てきたら成功です.
