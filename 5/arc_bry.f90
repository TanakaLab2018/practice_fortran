program index
  implicit none
  integer i,j
  real a(2,2),c(2,2)
  write(*,*) "index A"
  read(*,*) a(1,1),a(2,1),a(1,2),a(2,2)
  if(a(1,1)*a(2,2)-a(2,1)*a(1,2)==0) then
    write(*,*) "A^(-1) is none"
  else
    c(1,1)=a(2,2)/(a(1,1)*a(2,2)-a(2,1)*a(1,2))
    c(2,1)=-a(2,1)/(a(1,1)*a(2,2)-a(2,1)*a(1,2))
    c(1,2)=-a(1,2)/(a(1,1)*a(2,2)-a(2,1)*a(1,2))
    c(2,2)=a(1,1)/(a(1,1)*a(2,2)-a(2,1)*a(1,2))
    write(*,*) c
  end if
end program index
