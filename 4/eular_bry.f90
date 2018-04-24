program hello_world
  implicit none
  real h,x,xn,exact
  integer i,n
  open(80,file='euler.date')
  x=1.0
  n=10
  h=1.0/real(n)
  write(80,*) 0,x,abs(x-1.0),1.0
  do i=1,n
    xn=(1.0-5.0*h)*x
    exact=exp(-i*5.0*h)
    write(80,*) i*h,xn,abs(xn-exact),exact
    x=xn
  end do
  close(80)
end program hello_world
