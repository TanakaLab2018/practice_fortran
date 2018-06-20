program BdG2KSLDOS
  implicit none
  integer ,PARAMETER :: n=100, m=600
  complex(kind(0d0)) :: work(4*n*4*n), G(4*n,4*n)=0.0d0
  complex(kind(0d0)) :: c=(0.0d0,0.0010d0)

!  complex(kind(0d0)),PARAMETER :: ci = (0.0d0,1.0d0)
  DOUBLE PRECISION ::  mu=3.5d0, Lambda=1.0d0,  ky=0.0d0, w(4*n), E=0.0d0, p
  complex(kind(0d0)) :: delta=1.0d0, z, ci=(0.0d0,1.0d0)
  DOUBLE precision, PARAMETER :: pi=4.0d0*atan(1.0d0)
  integer :: info, i, j, ipiv(4*n), lwork=4*n*4*n
  !write(*,*) "kx=", "ky="
  !read(*,*) kx
  z=(delta)/(2*sqrt(mu))
 open(12,file='BdG2KSLDOS.txt', status='replace')

do j=0,m
  E=-3.0d0+dble(j)*0.010d0
  G=0.0d0
do i=1,n

  G(4*(i-1)+1,4*(i-1)+1)=E+c-(Lambda*(ky*ky+2)-mu)
  G(4*(i-1)+2,4*(i-1)+2)=E+c-(Lambda*(ky*ky+2)-mu)
  G(4*(i-1)+3,4*(i-1)+3)=E+c-(-Lambda*(ky*ky+2)+mu)
  G(4*(i-1)+4,4*(i-1)+4)=E+c-(-Lambda*(ky*ky+2)+mu)

end do
  do i=1,n-1
    G(4*(i-1)+1,4*i+1)=Lambda
    G(4*(i-1)+2,4*i+2)=Lambda
    G(4*(i-1)+3,4*i+3)=-Lambda
    G(4*(i-1)+4,4*i+4)=-Lambda

    G(4*(i-1)+1,4*i+4)=-z*ci
    G(4*(i-1)+2,4*i+3)=-z*ci
    G(4*(i-1)+3,4*i+2)=-conjg(z)*ci
    G(4*(i-1)+4,4*i+1)=-conjg(z)*ci


    G(4*i+1,4*(i-1)+1)=Lambda
    G(4*i+2,4*(i-1)+2)=Lambda
    G(4*i+3,4*(i-1)+3)=-Lambda
    G(4*i+4,4*(i-1)+4)=-Lambda

    G(4*i+1,4*(i-1)+4)=z*ci
    G(4*i+2,4*(i-1)+3)=z*ci
    G(4*i+3,4*(i-1)+2)=conjg(z)*ci
    G(4*i+4,4*(i-1)+1)=conjg(z)*ci
  end do
!Gの中見ここまで
 call zgetrf(4*n, 4*n, G, 4*n, ipiv, info)
 call zgetri(4*n, G, 4*n, ipiv, work, lwork, info)
! write(*,*) G(1,1), G(2,2)
 p=-(aimag(G(201,201)+G(202,202)))/pi
 write(12,*) E,p
end do
close(12)
end program BdG2KSLDOS
