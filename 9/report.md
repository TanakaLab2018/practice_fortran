# 連成振動を解いてみましょう

Nこの連成振動問題を考えてみます.

この問題は次のような連立微分方程式で書き表すことができます.

> <img src="https://latex.codecogs.com/gif.latex?m\frac{\partial}{\partial&space;t}v_i=-k(x_{i-1}-2x_i+x_{i+1})" />

> <img src="https://latex.codecogs.com/gif.latex?\frac{\partial}{\partial&space;t}x_i=v_i" />

上の二つの式は, 差分法を用いて次のように変形することが可能です.

> <img src="https://latex.codecogs.com/gif.latex?v_i(t_{j+1})=v_i(t_j)-\frac{k}{m}(x_{i-1}(t_j)-2x_i(t_j)+x_{i+1}(t_j))\Delta&space;t" />

> <img src="https://latex.codecogs.com/gif.latex?x_i(t_{j+1})=x_i(t_j)+v_i(t_j)\Delta&space;t" />

さらに, xやvをベクトルとして次のような式に落とし込むこともできます.

> <img src="https://latex.codecogs.com/gif.latex?{\bf&space;v}(t_{j+1})={\bf&space;v}(t_j)-\frac{k}{m}{\bf&space;C}{\bf&space;x}(t_j)\Delta&space;t" />

> <img src="https://latex.codecogs.com/gif.latex?{\bf&space;x}(t_{j+1})={\bf&space;x}(t_j)+{\bf&space;v}(t_j)\Delta&space;t" />

ただしCは係数の行列であり, 両端を固定端とすれば

> <img src="https://latex.codecogs.com/gif.latex?{\bf&space;C}=\begin{pmatrix}-2&&1&&0&&\cdots&&0\\1&&-2&&1&&\;&&\vdots\\\0&&\ddots&&\ddots&&\ddots&&0\\\vdots&&\;&&1&&-2&&1\\0&&\cdots&&0&&1&&-2\end{pmatrix}" />
