import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return -5.

N = 100 #分割数

t_range = 1. #時間の幅
h = t_range/float(N)    #刻み幅

x = np.zeros(N+1)  #ここに値を代入していく
t = np.arange(N+1)*h  #時間の座標の配列

x[0] = 1.   #初期値
for i in range(N):
    x[i+1] = (1. + f(t[i])*h)*x[i]

err = np.exp(-5.*t) - x

#以下グラフのプロットのための処理
fig = plt.figure(figsize=(12,6))
ax1 = fig.add_subplot(121)
ax1.plot(t, x)
ax1.plot(t, np.exp(-5.*t))
ax1.set_xlabel("time",fontsize=20)
ax1.set_ylabel("x",fontsize=20)
ax2 = fig.add_subplot(122)
ax2.plot(t, err)
ax2.set_xlabel("time",fontsize=20)
ax2.set_ylabel("err",fontsize=20)
plt.show()
