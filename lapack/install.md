# BLAS, LAPACK の導入方法

blasやlapackを用いると, 行列の様々な計算や数値計算などが簡単かつ高速に実行できるようになります.

fortranやc言語, pythonなどでも使われているとても強力なパッケージです.

## Macへのインストール方法

Homebrew を導入していると思うので, Terminalを開いて次のように打ってみてください.

```
  brew install blas lapack
```

これのみで完了です.

何らかのfortranのファイル(foo.f90)をコンパイルするときに

```
  gfortran foo.f90 -lm -lblas -llapack
```

と入力して問題なく動けば正常にインストールされています.

## Windowsへのインストール方法

Windowsへのインストールは実はかなり面倒くさいです...

1. まず **mingw-w64** のフォルダを探します. (僕のパソコンには```C:\Program Files (x86)\mingw-w64```にありました)

2. そのフォルダの中の, **mingw32** というフォルダまで移動してください.

3. mingw32の中に
  * *bin*
  * *lib*
  * *include*

  の三つのフォルダがあると思います.

4. [ここのディレクトリ](package_windows/)にも同様に, bin, lib, include の三つのフォルダがあるので, その中身を自分のパソコンの *bin*, *lib*, *include* の中にコピーしてみください.


何らかのfortranのファイル(foo.f90)をコンパイルするときに

```
  gfortran foo.f90 -lm -lblas -llapack
```

と入力して問題なく動けば正常にインストールされています.
