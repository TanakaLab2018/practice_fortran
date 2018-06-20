program BdG2
  !文字の定義
  implicit none
  integer, parameter :: l=100
  integer ,PARAMETER :: n=4*l, m=1000
  complex(kind(0d0)) :: H(n,n)=0.0d0, vl(n,n), vr(n,n), work(n*n)
  complex(kind(0d0)),PARAMETER :: ci = (0.0d0,1.0d0)
  DOUBLE PRECISION ::  mu=3.5d0, Lambda=1.0d0,  ky=0.0d0, rwork(3*n), w(n),kf=0.0d0
  complex(kind(0d0)) :: delta=1.0d0
  DOUBLE precision, PARAMETER :: pi=4.0d0*atan(1.0d0)
  integer :: info, i, j

  open(17,file='date1.txt', status='replace')
  !行列の入力
  do j=1,m
    ky=-pi+2.0d0*pi/dble(m-1)*dble(j-1)
    kf=sqrt(mu)
    H=0.0d0
  do i=1,l
    H(4*(i-1)+1,4*(i-1)+1)=Lambda*(ky*ky+2)-mu
    H(4*(i-1)+2,4*(i-1)+2)=Lambda*(ky*ky+2)-mu
    H(4*(i-1)+3,4*(i-1)+3)=-Lambda*(ky*ky+2)+mu
    H(4*(i-1)+4,4*(i-1)+4)=-Lambda*(ky*ky+2)+mu
  end do

  do i=1,l-1
    H(4*(i-1)+1,4*i+1)=-Lambda
    H(4*(i-1)+2,4*i+2)=-Lambda
    H(4*(i-1)+3,4*i+3)=Lambda
    H(4*(i-1)+4,4*i+4)=Lambda

    H(4*i+1,4*(i-1)+1)=-Lambda
    H(4*i+2,4*(i-1)+2)=-Lambda
    H(4*i+3,4*(i-1)+3)=Lambda
    H(4*i+4,4*(i-1)+4)=Lambda

    H(4*(i-1)+1,4*i+4)=ci*delta/(2*kf)
    H(4*(i-1)+2,4*i+3)=-ci*delta/(2*kf)
    H(4*(i-1)+3,4*i+2)=-ci*conjg(delta)/(2*kf)
    H(4*(i-1)+4,4*i+1)=ci*conjg(delta)/(2*kf)

    H(4*i+1,4*(i-1)+4)=-ci*delta/(2*kf)
    H(4*i+2,4*(i-1)+3)=ci*delta/(2*kf)
    H(4*i+3,4*(i-1)+2)=ci*conjg(delta)/(2*kf)
    H(4*i+4,4*(i-1)+1)=-ci*conjg(delta)/(2*kf)
  end do

  !行列の固有値の導出
  call zheev('n','u',n, H, n, w, work, n*n, rwork, info)

  do i=1,n
    write(17,*) ky,w(i)
  end do
  end do

  close(17)
end program BdG2
