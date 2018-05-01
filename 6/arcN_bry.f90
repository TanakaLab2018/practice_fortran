program index
  implicit none
  real a(4,4),c(4,4),buf,x,y
  integer i,j,k,n
  write(*,*) "n"
  read(*,*) n
  if(n>5) then
    write(*,*) "can not do"
  else
  write(*,*) "index A"
  do i=1,n,1
    do j=1,n,1
      read(*,*) a(j,i)
    end do
  end do
  c=0
  do j=1,n,1
    c(j,j)=1
  end do
  do j=1,n,1
    buf=1/a(j,j)
    do i=1,n,1
      x=a(j,i)*buf
      y=c(j,i)*buf
    end do
    do i=1,n,1
      if(j.ne.i) then
        buf=a(i,j)
        do k=1,n,1
          a(i,k)=a(i,k)-a(j,k)*buf
          c(i,k)=c(i,k)-c(j,k)*buf
        end do
      end if
    end do
  end do
  write(*,*) c
  end if
end program index
