program index
  implicit none
  double precision a(4),x(2),b(2)
  integer m,n,lda,nrhs,ipiv(2),info,ldb
  write(*,*) "index A"
  n=2
  a(1)=1.0
  a(2)=3.0
  a(3)=2.0
  a(4)=4.0
  lda=2
  nrhs=1
  b(1)=5.0
  b(2)=6.0
  ldb=2

  call dgesv(n,nrhs,a,lda,ipiv,b,ldb,info)

    write(*,*) "x = ",b(1)
    write(*,*) "y = ",b(2)

end program index
