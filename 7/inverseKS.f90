program inverse
  implicit none
  double precision a(2*2), work(2)
  integer :: m=2, n=2, lda=2, ipiv(2), info, lwork=2
  a(1)=1.0
  a(2)=3.0
  a(3)=2.0
  a(4)=4.0

  call dgetrf(m, n, a, lda, ipiv, info)
  call dgetri(n, a, lda, ipiv, work, lwork, info)

print *,"a(1)", a(1), "a(2)", a(2),  "a(3)", a(3), "a(4)", a(4)
end program inverse
