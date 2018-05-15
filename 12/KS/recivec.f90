program recivec
  implicit none

 double precision   :: a(3), b(3), c(3), d(3), e(3), f(3)
 double precision   :: V
 real, parameter    ::pi=atan(1.0d0)*4.0d0

 read (*,*) a
 read (*,*) b
 read (*,*) c
  V=a(1)*(b(2)*c(3)-b(3)*c(2))+a(2)*(b(3)*c(1)-b(1)*c(3))+a(3)*(b(1)*c(2)-b(2)*c(1))
! write (*,*)  V
 d(1)=2*pi/V*(b(2)*c(3)-b(3)*c(2))
 d(2)=2*pi/V*(b(3)*c(1)-b(1)*c(3))
 d(3)=2*pi/V*(b(1)*c(2)-b(2)*c(1))
write (*,*)  d

e(1)=2*pi/V*(c(2)*a(3)-c(3)*a(2))
e(2)=2*pi/V*(c(3)*a(1)-c(1)*a(3))
e(3)=2*pi/V*(c(1)*a(2)-c(2)*a(1))
write (*,*)  e

f(1)=2*pi/V*(a(2)*b(3)-a(3)*b(2))
f(2)=2*pi/V*(a(3)*b(1)-a(1)*b(3))
f(3)=2*pi/V*(a(1)*b(2)-a(2)*b(1))
write (*,*)  f

end program recivec
