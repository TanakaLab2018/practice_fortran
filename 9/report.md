# 連成振動を解いてみましょう

Nこの連成振動問題を考えてみます.

この問題は次のような連立微分方程式で書き表すことができます.

<img src="https://latex.codecogs.com/gif.latex?m\frac{\partial}{\partial&space;t}v_i=-k(x_{i-1}-2x_i+x_{i+1})" />

<img src="https://latex.codecogs.com/gif.latex?\frac{\partial}{\partial&space;t}x_i=v_i" />

さらに差分法を用いて次のように変形することが可能です.

<img src="https://latex.codecogs.com/gif.latex?v_i(t_{j+1})=v_i(t_j)-\frac{k}{m}(x_{i-1}(t_j)-2x_i(t_j)+x_{i+1}(t_j))" />

<img src="https://latex.codecogs.com/gif.latex?x_i(t_{j+1})=x_i(t_j)+v_i(t_j)" />
