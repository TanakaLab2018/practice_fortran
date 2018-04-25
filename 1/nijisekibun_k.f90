program nijisekibun
 implicit none
 integer i, N
 real a,b,c,x,j,f,h
 real L1,L2,S1,S
  print *,"系数？"
   read *, a,b,c
  print *, a, "x^2+", b, "x+", c, "=0"
  S=0.0
  print *, "刻み数"
  read *, N
  h=1.0/float(N)
   do i=0, N
     j=float(i)*h
     L1=f(j, a, b, c)
     L2=f(j+h, a, b, c)
     S1=((L1)+(L2))*(h)/2
     S=S+S1
   end do
  print *, "積分値は", S
end program nijisekibun

function f(x,a,b,c)
  real x, a, b, c, f
  f = a*x**2+b*x+c
end function
