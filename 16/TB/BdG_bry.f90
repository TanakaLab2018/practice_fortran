program bussei
  !数の定義
  implicit none
  integer, parameter :: n=4*100,m=100
  integer, parameter :: lda=n,ldvl=n,ldvr=n,lwork=10*n
  !complex(kind(0.0d0)) ::
  double precision, parameter :: pi=4.0d0*atan(1.0d0)
  double precision :: mu=3.5d0, Lambda=1.0d0, ky=0.0d0, delta=1.0d0
  integer info
  integer i,j
  double precision A(n,n),vl(n,n),vr(n,n),work(lwork),wr(n),wi(n)

  !行列Aの出力
  open(17,file='date1.txt',status='replace')
  !do j=1,m
    ky=0.0d0!-pi+2.0d0*pi/dble(m-1)*dble(j-1)

  A=0.0d0
  do i=1,m
    A(4*(i-1)+1,4*(i-1)+1)=Lambda*(ky*ky+2)-mu
    A(4*(i-1)+2,4*(i-1)+2)=Lambda*(ky*ky+2)-mu
    A(4*(i-1)+3,4*(i-1)+3)=-Lambda*(ky*ky+2)+mu
    A(4*(i-1)+4,4*(i-1)+4)=-Lambda*(ky*ky+2)+mu
    A(4*(i-1)+1,4*(i-1)+4)=delta
    A(4*(i-1)+2,4*(i-1)+3)=-delta
    A(4*(i-1)+3,4*(i-1)+2)=-delta
    A(4*(i-1)+4,4*(i-1)+2)=delta
  end do
  do i=1,m-1
    A(4*(i-1)+1,4*i+1)=-Lambda
    A(4*(i-1)+2,4*i+2)=-Lambda
    A(4*(i-1)+3,4*i+3)=Lambda
    A(4*(i-1)+4,4*i+4)=Lambda

    A(4*i+1,4*(i-1)+1)=-Lambda
    A(4*i+2,4*(i-1)+2)=-Lambda
    A(4*i+3,4*(i-1)+3)=Lambda
    A(4*i+4,4*(i-1)+4)=Lambda
  end do

  !固有値計算
  call dgeev('N','V',n,a,lda,wr,wi,vl,ldvl,vr, ldvr, work, lwork, info )

  !固有値、固有ベクトルの出力
  do i=1,n
    write(17,*) ky,wr(i)
  end do
  !end do
  close(17)

  write(*,*) "example completed."

end program bussei
