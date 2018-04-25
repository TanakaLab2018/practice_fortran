import numpy as np

N = 2 #行列サイズ
#NxNサイズの行列を0~10の範囲でランダムに生成
A = np.random.randint(0,10,N*N).reshape((N,N))
B = np.random.randint(0,10,N*N).reshape((N,N))

print("A =\n",A, "\n")  #行列Aを表示
print("B =\n",B, "\n")  #行列Bを表示
print("A+B =\n", A+B, "\n") #足し算A+Bを表示
print("AB =\n", A@B, "\n")  #掛け算ABを表示
print("BA =\n", B@A, "\n")  #掛け算BAを表示
print("A-1 =\n", np.linalg.inv(A), "\n")    #Aの逆行列を計算
print("AA-1 =\n", A@np.linalg.inv(A), "\n") #逆行列の検算
