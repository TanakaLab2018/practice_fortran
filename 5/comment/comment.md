全然参考にならない[サンプルコード](sample.py)

## 柘植さん

全体的に良くて来ていると思います.

逆行列を求めるプログラム```arc_bry.f90```([2018/04/25](../arc_bry.f90))についてですが,

行列式の値を変数として定義してみてはいかがでしょうか?

```fortran
det = a(1,1)*a(2,2)-a(2,1)*a(1,2)
```

そうするとさらに簡潔に書くことが出来るかもしれません.

(大橋良 2018/04/25)
