program daikei
  implicit none
  real a,b,c,x,S,S1,L1,L2,h,j
  integer i,N,d,e
  write(*,*) "二次関数a*x^2+b*X+cの係数"
  read(*,*) a,b,c
  write(*,*) "積分 hani d to e"
  read(*,*) d,e
  S=0.0
  write(*,*) "刻み幅　haba"
  read(*,*) N
  h=(e-d)/float(N)
  do i=0,N,1
    j=float(i)*h
    L1=a*j**2+b*j+c
    L2=a*(j+h)**2+b*(j+h)+c
    S1=(L1+L2)*h/2
    S=S1+S
  end do
  write(*,*) "二次関数をdからeまでで積分し"
  write(*,*) a,"x^2+",b,"x+",c
  write(*,*) S
end program daikei
