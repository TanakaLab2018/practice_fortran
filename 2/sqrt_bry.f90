program hello_world
  implicit none
  double precision a,b,x,f
  integer i
  write(*,*) "what is a?"
  read(*,*) a
  write(*,*) "what is b?"
  read(*,*) b
  do i=1,100
    x=(a+b)/2.0
    if(f(a)*f(x)>0) then
      a=x
    else
      b=x
    end if
    if(b-a<10.0**(-8)) exit
  end do
  write(*,*) "sqrt(2)"
  write(*,*) a,b,x
end program hello_world

function f(x)
  double precision  x, f
  f = x**2-2.0
 end function
