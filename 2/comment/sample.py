import numpy as np
from scipy.optimize import bisect, brentq   #bisectが二分法のモジュールです

def f(x):
    return x**2 - 2.

print(bisect(f, 1.0, 3.0))
print(brentq(f, 1.0, 3.0))
