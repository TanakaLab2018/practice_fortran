PROGRAM dg

      IMPLICIT NONE

      complex(kind(0d0)) ALPHA, BETA
      INTEGER   M, K, N, I, J
      PARAMETER (M=2, K=2, N=2)
      complex(kind(0d0))  A(M,K), B(K,N), C(M,N)

      PRINT *, "This example computes real matrix C=alpha*A*B+beta*C"

      !PRINT *, "Initializing data for matrix multiplication C=A*B for "
      !PRINT 10, " matrix A(",M," x",K, ") and matrix B(", K," x", N, ")"
      !FORMAT(a,I5,a,I5,a,I5,a,I5,a)
      !PRINT *, ""
      ALPHA = 1.0d0
      BETA = 0.0d0

      PRINT *, "Intializing matrix data"
      PRINT *, ""
      A(1,1)=1.0d0
      A(1,2)=1.0d0
      A(2,1)=2.0d0
      A(2,2)=2.0d0
      B(1,1)=0.0d0
      B(1,2)=0.0d0
      B(2,1)=2.0d0
      B(2,2)=3.0d0
      C=(0.0d0,0.0d0)



      CALL ZGEMM('N','N',M,N,K,ALPHA,A,M,B,K,BETA,C,M)

      write(*,*) c
      
      PRINT *, "Example completed."
      STOP

END PROGRAM dg
