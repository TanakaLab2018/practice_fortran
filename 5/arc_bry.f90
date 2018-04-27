program index
  implicit none
  integer i,j
  real a(2,2),c(2,2),det
  write(*,*) "index A"
  do i=1,2,1
    do j=1,2,1
      read(*,*) a(j,i)
    end do
  end do
  det=a(1,1)*a(2,2)-a(2,1)*a(1,2)
  if(det==0) then
    write(*,*) "A^(-1) is none"
  else
    c(1,1)=a(2,2)/det
    c(2,1)=-a(2,1)/det
    c(1,2)=-a(1,2)/det
    c(2,2)=a(1,1)/det
    write(*,*) c
  end if
end program index
