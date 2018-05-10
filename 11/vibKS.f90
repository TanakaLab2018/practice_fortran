program vibKS
  character :: jobz,uplo
  integer,parameter :: n=100
  integer   :: lda,lwork=(10*n),info

  double precision :: m(n,n)=0.0d0,w(n),work(10*n)


  integer           :: i,j

!微分方程式に現われる行列
do i=1,n
  m(i,i)=-2.0d0
end do
do i=1,n
  m(i+1,i)=1.0d0
  m(i,i+1)=1.0d0
end do
m=-m
!行列書くのここまで
!write(*,*) m
open(11,file='vibKS.txt',status='replace')

!write(*,*) "j=?"
!read *, j

call dsyev('v','u',n,m,n,w,work,lwork,info)
do i=1,n
  do j=1,n
write(11,fmt='(f15.8)',advance='no')  m(i,j)
end do
write(11,*)
end do
close(11)
 ! print *, m(1,1),m(1,2),m(1,3)

end program vibKS
