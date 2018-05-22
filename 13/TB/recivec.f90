program recivec
  implicit none

 !ベクトルの定義、πの設定
 double precision   :: a(3), b(3), c(3), d(3), e(3), f(3)
 double precision   :: V
 real, parameter    ::pi=atan(1.0d0)*4.0d0

 !三次元実格子ベクトルの読み込み
 write(*,*) "Vector a,b,c"
 read (*,*) a
 read (*,*) b
 read (*,*) c
 write(*,*) "三次元実格子ベクトル"
 write(*,*) a
 write(*,*) b
 write(*,*) c

 !体積の導出
  V=a(1)*(b(2)*c(3)-b(3)*c(2))+a(2)*(b(3)*c(1)-b(1)*c(3))+a(3)*(b(1)*c(2)-b(2)*c(1))

 !三次元逆格子ベクトルの導出
 d(1)=2*pi/V*(b(2)*c(3)-b(3)*c(2))
 d(2)=2*pi/V*(b(3)*c(1)-b(1)*c(3))
 d(3)=2*pi/V*(b(1)*c(2)-b(2)*c(1))

e(1)=2*pi/V*(c(2)*a(3)-c(3)*a(2))
e(2)=2*pi/V*(c(3)*a(1)-c(1)*a(3))
e(3)=2*pi/V*(c(1)*a(2)-c(2)*a(1))

f(1)=2*pi/V*(a(2)*b(3)-a(3)*b(2))
f(2)=2*pi/V*(a(3)*b(1)-a(1)*b(3))
f(3)=2*pi/V*(a(1)*b(2)-a(2)*b(1))

write(*,*) "三次元逆格子ベクトル"
write(*,*) d
write(*,*) e
write(*,*) f

end program recivec
