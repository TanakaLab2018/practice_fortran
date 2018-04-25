program hairetu
  implicit none
  real a(10), x, S
  integer i

  do i = 1, 10
    print *, "input a",i
    read *, a(i)
  end do

  S=0
  print *, "x ="
  read *, x

  do i = 1, 10
    S = S + a(i)*x**(i-1)
  end do

  print *, S

end program hairetu
