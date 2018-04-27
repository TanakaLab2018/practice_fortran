program index
  implicit none
  real a(2,2),b(2,2),c(2,2)
  integer i,j,k,l
  write(*,*) "index A"
  do i=1,2,1
    do j=1,2,1
      read(*,*) a(j,i)
    end do
  end do
  write(*,*) "index B"
  do k=1,2,1
    do l=1,2,1
      read(*,*) b(l,k)
    end do
  end do
  c=a+b
  write(*,*) c
end program index
