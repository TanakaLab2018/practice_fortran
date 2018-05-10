program vib
  implicit none
  integer, parameter    :: n=5,lwork=n*10
  integer               :: i,j,k
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

  !重さの入力
  do i=1,n
    m(i,i)=1.d0
  end do

  !固有値計算
  call DSYGV( 1, 'V', 'U', n, c, n, m, n, d, work, lwork, info)

  !プロット
  open(17,file='data1.txt',status='replace')
      j=1
    do k=1,n
      write(17, *) k/10.d0,c(k,j)
    end do
  close(17)

  open(18,file='data2.txt',status='replace')
      j=2
    do k=1,n
      write(18, *) k/10.d0,c(k,j)
    end do
  close(18)

  open(19,file='data3.txt',status='replace')
      j=3
    do k=1,n
      write(19, *) k/10.d0,c(k,j)
    end do
  close(19)

end program vib
