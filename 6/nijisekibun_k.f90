program nijisekibun
 implicit none
 integer i
 real a,b,c,x,j
 real L1,L2,S1,S
  print *,"系数？"
   read *, a,b,c
  print *, a, "x^2+", b, "x+", c, "=0"
  S=0
   do i=0, 10
     j=i/10
     L1=a*j**2.0+b*j+c
     L2=a*(j+0.1)**2.0+b*(j+0.1)+c
     S1=((L1)+(L2))*(0.10)/2
     S=S+S1
   end do
  print *, "積分値は", S
end program nijisekibun
