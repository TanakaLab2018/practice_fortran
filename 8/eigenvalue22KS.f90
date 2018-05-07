program eigenvalue22KS
  implicit none
  integer,PARAMETER :: n=2
  integer,PARAMETER :: lda=n, ldvl=n, ldvr=1, lwork=10*n
  DOUBLE precision :: a(lda,n), wr(n), wi(n), vl(ldvl,n), vr(ldvr,n), work(lwork)
  CHARACTER :: jobvl='V', jobvr='N'
  integer i, j, info



  a(1,1)=3.0
  a(1,2)=-1.0
  a(2,1)=-1.0
  a(2,2)=3.0

do i=1,n
  do j=1,n
print *, "a(i,j)=", a(i,j)
end do
end do

  call dgeev(jobvl, jobvr, n, a, lda, wr, wi, vl, ldvl, vr, ldvr, work, lwork, info)

print *, "wr(1)=", wr(1), "wr(2)=", wr(2)
print *, "wi(1)=", wi(1), "wi(2)=", wi(2)

do i=1,n
  do j=1,n
    print *, "vl(i,j)=", vl(i,j)
  end do
end do

end program eigenvalue22KS
