program index
  implicit none
  integer i,j
  real a(2,2),b(2,2),c(2,2)
  write(*,*) "index A"
  read(*,*) a(1,1),a(2,1),a(1,2),a(2,2)
  write(*,*) "index B"
  read(*,*) b(1,1),b(2,1),b(1,2),b(2,2)
  do i=1,2
    do j=1,2
      c(j,i)=a(j,1)*b(1,i)+a(j,2)*b(2,i)
    end do
  end do
  write(*,*) c
end program index
