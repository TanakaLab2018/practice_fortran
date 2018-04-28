program index
  implicit none
  integer i,j,k,l,m,n,k1
  real a(9,9),b(9,9),c(9,9)
  write(*,*) "n"
  read(*,*) n
  if(n>9) then
    write(*,*) "can not do"
  else
  write(*,*) "index A"
  do m=1,n,1
    do k=1,n,1
      read(*,*) a(k,m)
    end do
  end do
  write(*,*) "index B"
  do k=1,n,1
    do l=1,n,1
      read(*,*) b(l,k)
    end do
  end do
  do i=1,n
    do j=1,n
      c(j,i)=0
      do k1=1,n
        c(j,i)=c(j,i)+a(j,k1)*b(k1,i)
      end do
    end do
  end do
  write(*,*) c
end if
end program index
