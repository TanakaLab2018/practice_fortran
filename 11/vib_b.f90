program vib
  implicit none
  integer, parameter    :: n=3,lwork=n*10
  integer               :: i
  double precision      :: c(n,n)=0, m(n,n)=0, d(n)=0
  integer               :: info
  double precision      :: lworko=int(lwork)
  double precision      :: work(lwork)

  !係数行列C,格子をばねとしてみてるやつ
  do i=1,n
    c(i,i)=2.d0
  end do
  do i=1,n
    c(i,i+1)=-1.d0
    c(i+1,i)=-1.d0
  end do
  write(*,*) 'C='
  write(*,*) c

  !重さの入力
  do i=1,n
    write(*,*) 'what m',i
    read(*,*) m(i,i)
  end do
  write(*,*) 'M ='
  write(*,*) m

  !固有値計算
  call DSYGV( 1, 'V', 'U', n, c, n, m, n, d, work, lwork, info)

  !固有ベクトル
  write(*,*) 'U ='
  write(*,*) c

  !固有値
  write(*,*) 'D ='
  write(*,*) d

end program vib
