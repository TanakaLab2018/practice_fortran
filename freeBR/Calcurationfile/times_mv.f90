program mv
    implicit none

    !文字の導入
    complex(kind(0d0)) ALPHA, BETA
    INTEGER   INCX, INCY, M, LDA, N
    PARAMETER (M=2, N=2, INCX=1, INCY=1, LDA=2)
    complex(kind(0d0))  A(M,N), B(N), C(N)

    !計算するもの
    A=0.0d0
    B=0.0d0
    C=0.0d0
    ALPHA=1.0d0
    BETA=0.0d0
    A(1,1)=1.0d0
    A(2,1)=1.0d0
    A(1,2)=2.0d0
    A(2,2)=2.0d0
    B(1)=-1.0d0
    B(2)=2.0d0

    !導出
   call zgemv('N', M, N, ALPHA, A, LDA, B, INCX, BETA, C, INCY)
   !call zgemv('N', 2, 2, 1.0d0, A, 2, B, 1, 0.0d0, C, 1)
    write(*,*) C

end program mv