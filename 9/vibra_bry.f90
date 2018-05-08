program vibration
  implicit none
  integer,parameter  :: n=1024,time=1000000
  double precision   :: pi=atan(1.d0)*4.d0
  integer            :: i,j,range
  double precision   :: x(n)=0,v(n)=0,c(n,n)=0
  double precision   :: xo(n)=0,vo(n)=0,y(n)=0
  double precision   :: lambda=10.d0,dt=0.1d0,dx=1.d0/dble(n-1)
  character          :: filename*1000

  !動画のフレーム
  range=time/1000

  !係数行列C,格子をばねとしてみてるやつ
  do i=1,n
    c(i,i)=-2.d0
  end do
  do i=1,n
    c(i,i+1)=1.d0
    c(i+1,i)=1.d0
  end do

  !初期値の設定(x,v)
  do i=1,n
    x(i)=0.5d0*sin(2.d0*pi*dble(i-1)*dx)/(dble(i)*dx)
  end do
  do i=1,time
    xo=x
    vo=v
    !vの連立微分方程式
    call dgemv('N',n,n,1.d0,c,n,xo,1,0.d0,y,1)
    v=vo+lambda*y*dt
    !xの連立微分方程式
    x=xo+v*dt
    !1フレームごとに出力
    if(mod(i,range)==0) then
      write(*,'(a,i4)') "Writing the txt file --- No",i/range
      write(filename,'("plot_date",i4.4,".txt")') i/RANGE
      open(17,FILE=filename,STATUS='replace')
      do j=1,n
        write(17,'(f16.8," ",f16.8," ",f16.8)') dble(j-1)*dx,x(j),v(j)
      end do
      close(17)
    end if
  end do

end program vibration

!映像なぜかでません
