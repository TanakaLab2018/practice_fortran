program daikei
  implicit none
  real a,b,c,x,S,S1,L1,L2
  integer i
  write(*,*) "二次関数a*x^2+b*X+cの係数"
  read(*,*) a,b,c
  S=0.0
  do i=0,9,1
    L1=a*i**2+b*i+c
    L2=a*(i+1)**2+b*(i+1)+c
    S1=(L1+L2)/2
    S=S1+S
  end do
  write(*,*) "二次関数を0から10までで積分し"
  write(*,*) a,"x^2+",b,"x+",c
  write(*,*) S
end program daikei
