program bussei
  !数の定義
  implicit none
  integer, parameter :: l=100
  integer, parameter :: n=4*l,m=1000
  !integer, parameter :: lda=n,ldvl=n,ldvr=n,lwork=10*n
  complex(kind(0d0)), parameter :: ci = (0.0d0,1.0d0)
  double precision, parameter :: pi=4.0d0*atan(1.0d0)
  double precision :: mu=3.5d0, Lambda=1.0d0, ky=0.0d0 ,w(n),E,p,t,kf=0.0d0
  integer :: i,j,ipiv(n),lwork=n*n
  complex(kind(0d0)) :: delta=1.0d0,work(n*n),H(n,n)
  integer info
  !complex(kind(0d0)) :: ,vl(n,n),vr(n,n),work(lwork),wr(n),wi(n)

  !行列Aの出力
  open(17,file='date2.txt',status='replace')
  do j=0,600
    ky=0.0d0
    kf=sqrt(mu)
    t=0.01d0*j
    E=-3.0d0+t
  H=0.0d0

  do i=1,l
    H(4*(i-1)+1,4*(i-1)+1)=E+ci*0.0010d0-Lambda*(ky*ky+2)+mu
    H(4*(i-1)+2,4*(i-1)+2)=E+ci*0.0010d0-Lambda*(ky*ky+2)+mu
    H(4*(i-1)+3,4*(i-1)+3)=E+ci*0.0010d0+Lambda*(ky*ky+2)-mu
    H(4*(i-1)+4,4*(i-1)+4)=E+ci*0.0010d0+Lambda*(ky*ky+2)-mu

    H(4*(i-1)+1,4*(i-1)+4)=ky*delta/kf
    H(4*(i-1)+2,4*(i-1)+3)=ky*delta/kf
    H(4*(i-1)+3,4*(i-1)+2)=ky*conjg(delta)/kf
    H(4*(i-1)+4,4*(i-1)+1)=ky*conjg(delta)/kf
  end do

  do i=1,l-1
    H(4*(i-1)+1,4*i+1)=Lambda
    H(4*(i-1)+2,4*i+2)=Lambda
    H(4*(i-1)+3,4*i+3)=-Lambda
    H(4*(i-1)+4,4*i+4)=-Lambda

    H(4*i+1,4*(i-1)+1)=Lambda
    H(4*i+2,4*(i-1)+2)=Lambda
    H(4*i+3,4*(i-1)+3)=-Lambda
    H(4*i+4,4*(i-1)+4)=-Lambda

    H(4*(i-1)+1,4*i+4)=-delta/(2*kf)
    H(4*(i-1)+2,4*i+3)=-delta/(2*kf)
    H(4*(i-1)+3,4*i+2)=conjg(delta)/(2*kf)
    H(4*(i-1)+4,4*i+1)=conjg(delta)/(2*kf)

    H(4*i+1,4*(i-1)+4)=delta/(2*kf)
    H(4*i+2,4*(i-1)+3)=delta/(2*kf)
    H(4*i+3,4*(i-1)+2)=-conjg(delta)/(2*kf)
    H(4*i+4,4*(i-1)+1)=-conjg(delta)/(2*kf)
  end do

  !逆行列計算
  call zgetrf(n,n,H,n,ipiv,info)
  call zgetri(n,H,n,ipiv,work,lwork,info)

  !状態密度の導出
  p=-(aimag(H(201,201)+H(202,202)))/pi
    write(17,*) E,p
  end do
  close(17)

  write(*,*) "example completed."

end program bussei
