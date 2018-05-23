program bussei
！変数の指定
  implicit none
  integer, parameter :: n=2
  integer, parameter :: lda=n,ldvl=n,ldvr=n,lwork=10*n
  integer info
  double precision A(n*n),vl(n*n),vr(n*n),work(lwork),wr(n),wi(n)
！問題設定の確認
  write(*,*) "Ax=λx call x,λ"
！行列要素の指定
  a(1)=3.0
  a(2)=-2.0
  a(3)=-2.0
  a(4)=3.0
！行列を書き下している
  write(*,*) "index A"
  write(*,*) a(1),a(3)
  write(*,*) a(2),a(4)
！固有値と固有ベクトルを計算するlapack
  call dgeev('V','N',n,a,lda,wr,wi,vl,ldvl,vr, ldvr, work, lwork, info )
！結果の出力
  write(*,*) "eigenvalue λ real"
  call force(wr,n,1)
  write(*,*) "eigenvalue λ imagin"
  call force(wi,n,1)
  write(*,*) "eigenvalue vector x imagin"
  call force(vl,n,n)
！プログラムが終了したことを示す
  write(*,*) "example completed."

end program bussei
!出力をベクトル・行列の形で表示するサブルーチン
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
