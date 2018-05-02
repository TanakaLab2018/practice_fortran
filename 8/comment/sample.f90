PROGRAM eigen_of_matrix
  IMPLICIT NONE
  INTEGER,PARAMETER ::  N = 2
  INTEGER,PARAMETER ::  lda=N, ldvl=N, ldvr=N, lwork=10*N
  CHARACTER         ::  jobvr='N', jobvl='V'
  INTEGER           :: info
  DOUBLE PRECISION  :: A(lda,N), Vl(ldvl,N), Vr(ldvr,N), Work(lwork), Wr(N), Wi(N)

  A(1,1) = 3.0
  A(1,2) = 1.0
  A(2,1) = 2.0
  A(2,2) = 2.0

  PRINT *, 'A='
  CALL print_matrix(A,N,N)

  CALL DGEEV( jobvl, jobvr, N, A, lda, Wr, Wi, Vl, ldvl, Vr, ldvr, Work, lwork, info )

  PRINT *, 'wr=(固有値の実数部分)'
  CALL print_matrix(wr,N,1)
  PRINT *, 'wi=(固有値の虚数部分)'
  CALL print_matrix(wi,N,1)

  PRINT *, 'vl=(固有ベクトル)'
  CALL print_matrix(vl,N,N)



END PROGRAM eigen_of_matrix


!:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
!::: 行列表示のためのサブルーチン
!::: 引数はprint_matrix(_表示したい(N,M)行列の配列_, _正方行列の行数_)
subroutine print_matrix(X,N,M)
  integer i, j, N, M
  double precision X(N,M)
  do i=1,N
    do j=1,M
      write(*,fmt='(f15.8)',advance='no') X(i,j)
    end do
    write(*,*)
  end do
  print *, "==============================="
end subroutine
