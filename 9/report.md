# 1次元の弦についての微分方程式を解いて, グラフにしてみましょう

端っこが固定された一次元の弦についての運動方程式は次のようになります.

> <img src="https://latex.codecogs.com/gif.latex?\frac{\partial^2}{\partial&space;t^2}u(x,t)=k\frac{\partial^2}{\partial&space;x^2}u(x,t)" />

この方程式の右辺について中心差分をとると次のように書けます.

> <img src="https://latex.codecogs.com/gif.latex?(R.H.S)\approx&space;k\frac{U(x-\Delta&space;x,t)-2u(x,t)+u(x+\Delta&space;x,t)}{\Delta&space;x^2}" />

また左辺も同様に次のように書けます.

> <img src="https://latex.codecogs.com/gif.latex?(L.H.S)\approx&space;k\frac{U(x,t-\Delta&space;t)-2u(x,t)+u(x,t+\Delta&space;t)}{\Delta&space;t^2}" />

つまり, まとめると次の通り.

> <img src="https://latex.codecogs.com/gif.latex?u(x,t+\Delta&space;t)\approx&space;2u(x,t)-u(x,t-\Delta&space;t)+k\frac{\Delta&space;t^2}{\Delta&space;x^2}\frac{U(x+\Delta&space;x,t)-2u(x,t)+u(x+\Delta&space;x,t)}{\Delta&space;x^2}" />

この方程式を行列に落とし込んで解いてみましょう.


今回は初期条件として 以下を使用してみてください.

<img src="https://latex.codecogs.com/gif.latex?u(x,t)=u(x,t-\Delta&space;t)=\begin{cases}x&(0\le&space;x\le0.5\\-x+1&(0.5\le&space;x\le1.0)\end{cases}" />