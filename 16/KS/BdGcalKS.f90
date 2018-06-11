program BdGcalKS
  implicit none
  integer ,PARAMETER :: n=1000
  complex(kind(0d0)) :: H(4*n,4*n)=0.0d0, vl(4*n,4*n), vr(4*n,4*n), work(4*n*4*n)
!  complex(kind(0d0)),PARAMETER :: ci = (0.0d0,1.0d0)
  DOUBLE PRECISION ::  mu=1.0d0, Lambda=1.0d0,  ky=1.0d0, rwork(3*4*n), p=1.0d0, w(4*n)
  complex(kind(0d0)) :: delta=0.01
  DOUBLE precision, PARAMETER :: pi=4.0d0*atan(1.0d0)
  integer :: info, i, j
  !write(*,*) "kx=", "ky="
  !read(*,*) kx
 open(10,file='BdGcalKS.txt', status='replace')
  ky=0.0d0
do i=1,n

  H(4*(i-1)+1,4*(i-1)+1)=p*(ky*ky+2)-mu
  H(4*(i-1)+2,4*(i-1)+2)=p*(ky*ky+2)-mu
  H(4*(i-1)+3,4*(i-1)+3)=-p*(ky*ky+2)+mu
  H(4*(i-1)+4,4*(i-1)+4)=-p*(ky*ky+2)+mu
  H(4*(i-1)+1,4*(i-1)+4)=delta
  H(4*(i-1)+2,4*(i-1)+3)=-delta
  H(4*(i-1)+3,4*(i-1)+2)=-conjg(delta)
  H(4*(i-1)+4,4*(i-1)+2)=conjg(delta)
end do
do i=1,n-1
  H(4*(i-1)+1,4*i+1)=-Lambda
  H(4*(i-1)+2,4*i+2)=-Lambda
  H(4*(i-1)+3,4*i+3)=Lambda
  H(4*(i-1)+4,4*i+4)=Lambda

  H(4*i+1,4*(i-1)+1)=-Lambda
  H(4*i+2,4*(i-1)+2)=-Lambda
  H(4*i+3,4*(i-1)+3)=Lambda
  H(4*i+4,4*(i-1)+4)=Lambda
end do
write(*,*) "OK"
  call zheev('n','u',4*n, H, 4*n, w, work, 4*n*4*n, rwork, info)
do i=1,4*n
 write(10,*) (w(i))
end do
close(10)
end program BdGcalKS
