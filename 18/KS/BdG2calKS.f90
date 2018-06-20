program BdG2calKS
  implicit none
  integer ,PARAMETER :: n=100, m=100
  complex(kind(0d0)) :: H(4*n,4*n)=0.0d0, vl(4*n,4*n), vr(4*n,4*n), work(4*n*4*n)
!  complex(kind(0d0)),PARAMETER :: ci = (0.0d0,1.0d0)
  DOUBLE PRECISION ::  mu=3.5d0, Lambda=1.0d0,  ky=0.0d0, rwork(3*4*n), w(4*n)
  complex(kind(0d0)) :: delta=1.0d0, z, ci=(0.0d0,1.0d0)
  DOUBLE precision, PARAMETER :: pi=4.0d0*atan(1.0d0)
  integer :: info, i, j
  !write(*,*) "kx=", "ky="
  !read(*,*) kx
 open(10,file='BdG2calKS.txt', status='replace')
 z=(delta*ci)/(2*sqrt(mu))
do j=1,m
  ky=-pi+2.0d0*pi/dble(m-1)*dble(j-1)

H=0.0d0
do i=1,n

  H(4*(i-1)+1,4*(i-1)+1)=Lambda*(ky*ky+2)-mu
  H(4*(i-1)+2,4*(i-1)+2)=Lambda*(ky*ky+2)-mu
  H(4*(i-1)+3,4*(i-1)+3)=-Lambda*(ky*ky+2)+mu
  H(4*(i-1)+4,4*(i-1)+4)=-Lambda*(ky*ky+2)+mu

end do
do i=1,n-1
  H(4*(i-1)+1,4*i+1)=-Lambda
  H(4*(i-1)+2,4*i+2)=-Lambda
  H(4*(i-1)+3,4*i+3)=Lambda
  H(4*(i-1)+4,4*i+4)=Lambda

  H(4*(i-1)+1,4*i+4)=-z
  H(4*(i-1)+2,4*i+3)=-z
  H(4*(i-1)+3,4*i+2)=conjg(z)
  H(4*(i-1)+4,4*i+1)=conjg(z)


  H(4*i+1,4*(i-1)+1)=-Lambda
  H(4*i+2,4*(i-1)+2)=-Lambda
  H(4*i+3,4*(i-1)+3)=Lambda
  H(4*i+4,4*(i-1)+4)=Lambda

  H(4*i+1,4*(i-1)+4)=z
  H(4*i+2,4*(i-1)+3)=z
  H(4*i+3,4*(i-1)+2)=-conjg(z)
  H(4*i+4,4*(i-1)+1)=-conjg(z)
end do
  call zheev('n','u',4*n, H, 4*n, w, work, 4*n*4*n, rwork, info)
do i=1,4*n
 write(10,*) ky,w(i)
end do
end do
close(10)
end program BdG2calKS
