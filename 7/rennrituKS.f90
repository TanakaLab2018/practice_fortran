program rennritu
  implicit none

  double precision a(2*2), b(2)
  integer :: n=2, nrhs=1, lda=2, ipiv(2), ldb=2, info
  a(1)=1.0
  a(2)=3.0
  a(3)=2.0
  a(4)=4.0
  b(1)=5.0
  b(2)=6.0


  call dgesv(n, nrhs, a, lda, ipiv, b, ldb, info)

print *,"b(1)",b(1), "b(2)", b(2)
end program rennritu
