program equation
    implicit none

    !文字の導入
    complex(kind(0d0)) ALPHA, BETA
    INTEGER   NRHS, M, LDA, N
    PARAMETER (M=2, N=2)
    INTEGER IPIV(N), LDB, INFO
    complex(kind(0d0))  A(M,N), B(N), C(N)
    

    !設定
    LDA=2
    LDB=2
    NRHS=1

    !計算するもの
    A=0.0d0
    B=0.0d0
    C=0.0d0
    ALPHA=1.0d0
    BETA=0.0d0
    A(1,1)=1.0d0
    A(2,1)=1.0d0
    A(1,2)=1.0d0
    A(2,2)=-1.0d0
    B(1)=3.0d0
    B(2)=-1.0d0

    !導出
   call zgesv(N,NRHS,A,LDA,IPIV,B,LDB,INFO)
   !call zgesv('N', 2, 2, 1.0d0, A, 2, B, 1, 0.0d0, C, 1)
    write(*,*) B

end program equation