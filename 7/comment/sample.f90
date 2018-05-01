program inverse
  implicit none
  integer, parameter :: N=2
  double precision A(N,N), A_inv(N,N), C(N,N), work(N)
  integer :: lda=N, ipiv(N), info, lwork=N

  call random_number(A)   ! ランダムで2x2行列を生成

  print *,"A="
  call print_matrix(A,N)    !行列の表示のためのサブルーチン

  A_inv = A   !行列を保存するために, A_invにAを代入しておいた
  call dgetrf(N, N, A_inv, lda, ipiv, info)
  call dgetri(N, A_inv, lda, ipiv, work, lwork, info)

  print *,"A_inv"
  call print_matrix(A_inv,N)

  call dgemm('N', 'N', N, N, N, 1.d0, A, N, A_inv, N, 0.d0, C, N)

  print *,"C"
  call print_matrix(C,N)

end program inverse

!:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
!::: 行列表示のためのサブルーチン
!::: 引数はprint_matrix(_表示したい正方行列の配列_, _正方行列の行数_)
subroutine print_matrix(X,N)
  integer i, j, N
  double precision X(N,N)
  do i=1,n
    do j=1,n
      write(*,fmt='(f15.8)',advance='no') X(i,j)
    end do
    write(*,*)
  end do
  print *, "==============================="
end subroutine
