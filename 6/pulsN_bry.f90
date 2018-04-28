program index
  implicit none
  real a(9,9),b(9,9),c(9,9)
  integer i,j,k,l,n
  write(*,*) "n"
  read(*,*) n
  if(n>9) then
    write(*,*) "can not do"
  else
  write(*,*) "index A"
  do i=1,n,1
    do j=1,n,1
      read(*,*) a(j,i)
    end do
  end do
  write(*,*) "index B"
  do k=1,n,1
    do l=1,n,1
      read(*,*) b(l,k)
    end do
  end do
  c=a+b
  write(*,*) c
  end if
end program index
