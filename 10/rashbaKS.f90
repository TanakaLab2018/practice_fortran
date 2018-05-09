program rashbaKS
  IMPLICIT none
  complex(kind(0d0)) :: H(2,2)=0.0d0, w(2), vl(2,2), vr(2,2), work(4)
  complex(kind(0d0)),PARAMETER :: ci = (0.0d0,1.0d0)
  DOUBLE PRECISION :: a=1.0d0, lam=1.0d0, kx, ky=0.0d0, rwork(4), m=0.10

  DOUBLE precision, PARAMETER :: pi=4.0d0*atan(1.0d0)
  integer :: info, i, n=64, j
  !write(*,*) "kx=", "ky="
  !read(*,*) kx
  open(10,file='rashbaKS.txt', status='replace')
do i=1,n
  do j=1,n
  kx=-pi+2.0d0*pi/dble(n-1)*dble(i-1)
  ky=-pi+2.0d0*pi/dble(n-1)*dble(j-1)
  kx = kx*0.1d0
  ky = ky*0.1d0

  H(1,1)=a*(kx**2+ky**2)+m
  H(1,2)=lam*(kx-ci*ky)
  H(2,1)=lam*(kx+ci*ky)
  H(2,2)=a*(kx**2+ky**2)-m

  call zgeev('n','v',2, H, 2, w, vl, 2, vr, 2, work, 4, rwork, info)

 write(10,*) kx,ky,real(w)
end do
end do
close(10)
end program rashbaKS
