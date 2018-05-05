# Rashbaスピン軌道相互作用

Rashbaスピン軌道相互作用のある系のハミルトニアンは次のように表されることが知られています.

> <img src="https://latex.codecogs.com/gif.latex?\frac{\hbar^2{\bf&space;k}^2}{2m}\sigma_0+\lambda(k_y\sigma_x-k_x\sigma_y)" />

1. lapackを使って, あるk=(kx,ky)である時の固有値を求めてみましょう.

2. DO文を用いて, Brillouin Zone 内すべての波数について固有値を求め, *.txt* ファイルに書き出してみましょう. (ヒント: 2つの固有値のうち, 大きいほうを *data_1.txt* , 小さいほうを *data_2.txt* のように分けておくと便利)

3. 先程出力した *.txt* ファイルを gnuplot を用いて三次元にプロットしてみましょう. [参考サイト](http://heim.ifi.uio.no/inf3330/scripting/doc/gnuplot/Kawano/datafile.html)
