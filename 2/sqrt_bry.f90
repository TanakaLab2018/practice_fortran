program hello_world
  implicit none
  double precision a,b,c,x1,x2
  integer i
  write(*,*) "what is a?"
  read(*,*) a
  write(*,*) "what is b?"
  read(*,*) b
  write(*,*) "what is c"
  read(*,*) c
  x1=(-b+sqrt(b**2-4*a*c))/2*a
  x2=(-b-sqrt(b**2-4*a*c))/2*a
  if(b**2-4*a*c>=0) then
    write(*,*) "ax^2+bx+c=0 answer is"
    write(*,*) x1,x2
    else
    write(*,*) "answer is none"
    end if
  end program hello_world
