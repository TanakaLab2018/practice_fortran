PROGRAM dg

      IMPLICIT NONE

      DOUBLE PRECISION ALPHA, BETA
      INTEGER          M, K, N, I, J
      PARAMETER        (M=2, K=2, N=2)
      DOUBLE PRECISION A(M,K), B(K,N), C(M,N)

      PRINT *, "This example computes real matrix C=alpha*A*B+beta*C"

      PRINT *, "Initializing data for matrix multiplication C=A*B for "
      PRINT 10, " matrix A(",M," x",K, ") and matrix B(", K," x", N, ")"
10    FORMAT(a,I5,a,I5,a,I5,a,I5,a)
      PRINT *, ""
      ALPHA = 1.0
      BETA = 0.0

      PRINT *, "Intializing matrix data"
      PRINT *, ""
      A(1,1)=1
      A(1,2)=1
      A(2,1)=2
      A(2,2)=2
      B(1,1)=0
      B(1,2)=0
      B(2,1)=2
      B(2,2)=3
      C=0



      CALL DGEMM('N','N',M,N,K,ALPHA,A,M,B,K,BETA,C,M)


      PRINT *, "Top left corner of matrix A:"
      PRINT 20, ((A(I,J), J = 1,MIN(K,6)), I = 1,MIN(M,6))
      PRINT *, ""

      PRINT *, "Top left corner of matrix B:"
      PRINT 20, ((B(I,J),J = 1,MIN(N,6)), I = 1,MIN(K,6))
      PRINT *, ""

 20   FORMAT(6(F12.0,1x))

      PRINT *, "Top left corner of matrix C:"
      PRINT 30, ((C(I,J), J = 1,MIN(N,6)), I = 1,MIN(M,6))
      PRINT *, ""

 30   FORMAT(6(ES12.4,1x))

      PRINT *, "Example completed."
      STOP

END PROGRAM dg
