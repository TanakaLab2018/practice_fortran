!px＋ipyのLDOSのエッジ
program BdG3LDOSKS
  implicit none
  integer ,PARAMETER :: n=100, m=600
  complex(kind(0d0)) :: work(4*n*4*n), G(4*n,4*n)=0.0d0

!  complex(kind(0d0)),PARAMETER :: ci = (0.0d0,1.0d0)
  DOUBLE PRECISION ::  mu=3.5d0, Lambda=1.0d0,  ky=0.0d0, w(4*n), E=0.0d0, p
  complex(kind(0d0)) :: delta=1.0d0, C, ci=(0.0d0,0.0010d0)
  DOUBLE precision, PARAMETER :: pi=4.0d0*atan(1.0d0)
  integer :: info, i, j, ipiv(4*n), lwork=4*n*4*n

  !write(*,*) "kx=", "ky="
  !read(*,*) kx
 open(12,file='data.txt', status='replace')
 ky=-pi/4.0d0
C=(delta)/(sqrt(mu)*4.0d0)
do j=0,m
  E=-3.0d0+dble(j)*0.010d0
  G=0.0d0
do i=1,n

  G(4*(i-1)+1,4*(i-1)+1)=E+ci-(Lambda*(ky*ky+2)-mu)
  G(4*(i-1)+2,4*(i-1)+2)=E+ci-(Lambda*(ky*ky+2)-mu)
  G(4*(i-1)+3,4*(i-1)+3)=E+ci-(-Lambda*(ky*ky+2)+mu)
  G(4*(i-1)+4,4*(i-1)+4)=E+ci-(-Lambda*(ky*ky+2)+mu)

  G(4*(i-1)+1,4*(i-1)+4)=2.0d0*C*ky
  G(4*(i-1)+2,4*(i-1)+3)=2.0d0*C*ky
  G(4*(i-1)+3,4*(i-1)+2)=2.0d0*conjg(C)*ky
  G(4*(i-1)+4,4*(i-1)+1)=2.0d0*conjg(C)*ky


end do
  do i=1,n-1
    G(4*(i-1)+1,4*i+1)=Lambda
    G(4*(i-1)+2,4*i+2)=Lambda
    G(4*(i-1)+3,4*i+3)=-Lambda
    G(4*(i-1)+4,4*i+4)=-Lambda

    G(4*(i-1)+1,4*i+4)=-C
    G(4*(i-1)+2,4*i+3)=-C
    G(4*(i-1)+3,4*i+2)=conjg(C)
    G(4*(i-1)+4,4*i+1)=conjg(C)


    G(4*i+1,4*(i-1)+1)=Lambda
    G(4*i+2,4*(i-1)+2)=Lambda
    G(4*i+3,4*(i-1)+3)=-Lambda
    G(4*i+4,4*(i-1)+4)=-Lambda

    G(4*i+1,4*(i-1)+4)=C
    G(4*i+2,4*(i-1)+3)=C
    G(4*i+3,4*(i-1)+2)=-conjg(C)
    G(4*i+4,4*(i-1)+1)=-conjg(C)
  end do
!Gの中見ここまで
 call zgetrf(4*n, 4*n, G, 4*n, ipiv, info)
 call zgetri(4*n, G, 4*n, ipiv, work, lwork, info)
! write(*,*) G(1,1), G(2,2)
 p=-(aimag(G(1,1)+G(2,2)))/pi
 write(12,*) E,p
end do
close(12)
end program BdG3LDOSKS
