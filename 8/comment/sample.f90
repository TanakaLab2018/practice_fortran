PROGRAM eigen_of_matrix
  IMPLICIT NONE
  INTEGER,PARAMETER ::  N = 2
  INTEGER,PARAMETER ::  lda=N, ldvl=N, ldvr=N, lwork=10*N
  CHARACTER         ::  jobvr='N', jobvl='V'
  INTEGER           :: info
<<<<<<< HEAD
  DOUBLE PRECISION   A(lda,N), Vl(ldvl,N), Vr(ldvr,N), Work(lwork), Wr(N), Wi(N)
=======
  DOUBLE PRECISION  :: A(lda,N), Vl(ldvl,N), Vr(ldvr,N), Work(lwork), Wr(N), Wi(N)
>>>>>>> 012c2388a7d20d0e75f2c0d494461be41a2f5b82

  A(1,1) = 3.0
  A(1,2) = -1.0
  A(2,1) = -1.0
  A(2,2) = 3.0

  PRINT *, 'A='
  CALL Print_Matrix(A,N,N)

  CALL DGEEV( jobvl, jobvr, N, A, lda, Wr, Wi, Vl, ldvl, Vr, ldvr, Work, lwork, info )

  PRINT *, 'wr=(固有値の実数部分)'
  CALL Print_Matrix(Wr,N,1)
  PRINT *, 'wi=(固有値の虚数部分)'
  CALL Print_Matrix(Wi,N,1)

  PRINT *, 'vl=(固有ベクトル)'
  CALL Print_Matrix(Vl,N,N)

END PROGRAM eigen_of_matrix


!:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

!::: 行列表示のためのサブルーチン

!::: 引数はprint_matrix(_表示したい(N,M)行列の配列_, _正方行列の行数_)

SUBROUTINE Print_Matrix(X,N,M)
  INTEGER i, j, N, M
  DOUBLE PRECISION X(N,M)
  DO i=1,N
    DO j=1,M
      WRITE(*,fmt='(f15.8)',advance='no') X(i,j)
    END DO
    WRITE(*,*)
  END DO
  PRINT *, "==============================="
END SUBROUTINE
