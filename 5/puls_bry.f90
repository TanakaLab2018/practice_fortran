program index
  implicit none
  real a(2,2),b(2,2),c(2,2)
  write(*,*) "index A"
  read(*,*) a(1,1),a(2,1),a(1,2),a(2,2)
  write(*,*) "index B"
  read(*,*) b(1,1),b(2,1),b(1,2),b(2,2)
  c=a+b
  write(*,*) c
end program index
