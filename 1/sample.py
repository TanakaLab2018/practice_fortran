import numpy as np
from scipy.integrate import quad

def f(x,c): #係数のリストの大きさによって関数の次元が変化します
    return np.sum([c[i]*x**i for i in range(len(c))])

c_0 = np.array([1, -4, 3])   #関数の係数を表した配列です

x_range = np.array([0., 10.])    #積分の範囲を与えています

print(quad(f, x_range[0], x_range[1], args=c_0))
