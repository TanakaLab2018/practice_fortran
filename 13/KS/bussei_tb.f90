program bussei
  !数の定義
  implicit none
  integer, parameter :: n=2
  integer, parameter :: lda=n,ldvl=n,ldvr=n,lwork=10*n
  integer info
  double precision A(n*n),vl(n*n),vr(n*n),work(lwork),wr(n),wi(n)

  !行列Aの出力
  write(*,*) "Ax=λx call x,λ"
  a(1)=3.0
  a(2)=-2.0
  a(3)=-2.0
  a(4)=3.0
  write(*,*) "index A"
  write(*,*) a(1),a(3)
  write(*,*) a(2),a(4)

  !固有値計算
  call dgeev('V','N',n,a,lda,wr,wi,vl,ldvl,vr, ldvr, work, lwork, info )

  !固有値、固有ベクトルの出力
  write(*,*) "eigenvalue λ real"
  call force(wr,n,1)
  write(*,*) "eigenvalue λ imagin"
  call force(wi,n,1)
  write(*,*) "eigenvalue vector x imagin"
  call force(vl,n,n)

  write(*,*) "example completed."

end program bussei

  !固有値の出力の仕方
subroutine force(x,n,m)
  integer i,j,n,m
  double precision x(n,m)
  do i=1,n,1
    do j=1,m,1
      write(*,fmt='(f15.8)',advance="no") x(i,j)
    end do
    write(*,*)
  end do
  write(*,*) "==========================="
end subroutine 
