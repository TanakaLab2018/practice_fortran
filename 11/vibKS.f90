program vibKS
  character :: jobz,uplo
  integer   :: lda,lwork=30,info
  double precision :: m(8,8)=0.0d0,w(8),work(30)

  integer,parameter :: n=8
  integer           :: i

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

call dsyev('v','u',n,m,n,w,work,lwork,info)
do i=1,n
write(11,*)  m(i,8)
end do
close(11)
 ! print *, m(1,1),m(1,2),m(1,3)

end program vibKS
