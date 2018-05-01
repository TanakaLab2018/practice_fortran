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
  do i=1,n,1
    c(i,i)=1
  end do
  do i=1,n,1
    buf=1/a(i,i)
    do j=1,n,1
      x=a(j,i)*buf
      y=c(j,i)*buf
      a(j,i)=x
      c(j,i)=y
    end do
    do j=1,n,1
      if(i.ne.j) then
        buf=a(i,j)
        do k=1,n,1
          a(k,j)=a(k,j)-a(k,i)*buf
          c(k,j)=c(k,j)-c(k,i)*buf
        end do
      end if
    end do
  end do
  write(*,*) c
  end if
end program index
