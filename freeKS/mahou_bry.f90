program mahou
  implicit none
  integer a(7,7)
  integer i,j,k,n
  a=0
  a(4,1)=1
  i=1
  j=4
  n=7
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
    write(*,*) a(j,1),a(j,2),a(j,3),a(j,4),a(j,5),a(j,6),a(j,7)
  end do
end program mahou
