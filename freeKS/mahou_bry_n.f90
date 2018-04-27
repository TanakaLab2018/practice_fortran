program mahou
  implicit none
  integer i,j,k,n
  integer,allocatable,dimension(:) :: a
  n=7
  allocate(a(n,n))
  a=0
  a(4,1)=1
  i=1
  j=4

  do k=1,n**2
    if(i==1) then
      if(j>1.and.a(j-1,n)==0) then
        a(j-1,n)=k+1
        j=j-1
        i=n
      else
        a(j,i+1)=k+1
        i=i+1
        j=j
      end if
    else if(j==1) then
        if(a(n,i-1)==0) then
           a(n,i-1)=k+1
           j=n
           i=i-1
        else
          a(j,i+1)=k+1
          i=i+1
          j=j
        end if
    else
      if(a(j-1,i-1)==0) then
        a(j-1,i-1)=k+1
        i=i-1
        j=j-1
      else
        a(j,i+1)=k+1
        i=i+1
        j=j
      end if
    end if
  end do
  do j=1,n
    do k=1,n
      write(*,fmt='(I4)',advance='no') a(j,k)
    end do
    write(*,*)
  end do
  deallocate(a)
end program mahou
