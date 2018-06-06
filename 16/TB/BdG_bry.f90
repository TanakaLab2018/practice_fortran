program bussei
  !数の定義
  implicit none
  integer, parameter :: n=4*5
  integer, parameter :: lda=n,ldvl=n,ldvr=n,lwork=10*n
  integer info
  integer i
  double precision A(n,n),vl(n,n),vr(n,n),work(lwork),wr(n),wi(n)

  !行列Aの出力
  A=0.0
  write(*,*) "Ax=λx call x,λ"
  do i=1,4
    A(i,4*i-3)=2.0
  end do
  do i=1,3
    A(i,4*i+1)=1.0
  end do
  do i=1,3
    A(i+1,4*i-3)=1.0
  end do

  !固有値計算
  call dgeev('V','N',n,a,lda,wr,wi,vl,ldvl,vr, ldvr, work, lwork, info )

  !固有値、固有ベクトルの出力
  open(17,file='date1.txt',status='replace')
  write(17,*) "eigenvalue λ real"
  call force(wr,n,1)
  write(17,*) "eigenvalue λ imagin"
  call force(wi,n,1)
  write(17,*) "eigenvalue vector x imagin"
  call force(vl,n,n)
  close(17)

  write(*,*) "example completed."

end program bussei

  !固有値の出力の仕方
subroutine force(x,n,m)
  integer i,j,n,m
  double precision x(n,m)
  do i=1,n,1
    do j=1,m,1
      write(17,fmt='(f15.8)',advance="no") x(i,j)
    end do
    write(17,*)
  end do
  write(17,*) "==========================="
end subroutine
