program index
  implicit none
  integer i,j,k,l,m,n,k1
  real a(2,2),b(2,2),c(2,2)
  write(*,*) "index A"
  do m=1,2,1
    do n=1,2,1
      read(*,*) a(n,m)
    end do
  end do
  write(*,*) "index B"
  do k=1,2,1
    do l=1,2,1
      read(*,*) b(l,k)
    end do
  end do
  do i=1,2
    do j=1,2
      c(j,i)=0
      do k1=1,2
        c(j,i)=c(j,i)+a(j,k1)*b(k1,i)
      end do
    end do
  end do
  write(*,*) c
end program index
