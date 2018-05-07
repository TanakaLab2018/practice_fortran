PROGRAM Rashba
  IMPLICIT NONE
  INTEGER,PARAMETER   ::  SIZE = 31, N = 2
  INTEGER,PARAMETER   ::  lda = N, lwork = 10*N
  DOUBLE PRECISION    ::  M_Pi = atan(1d0)*4d0
  DOUBLE PRECISION    ::  kx, ky, dk = 2d0*atan(1d0)*4d0/dble(SIZE-1), rwork(3*N-2), energy(N)
  INTEGER             ::  info, i, j
  COMPLEX*16          ::  H(N,N), work(lwork)

  OPEN(17, FILE='data.txt', STATUS='replace')

  DO i = 1, SIZE
    kx = (dk*dble(i-1) - M_Pi)*0.1d0
    DO j = 1, SIZE
      ky = (dk*dble(j-1) - M_Pi)*0.1d0
      CALL Hamiltonian(kx, ky, H)
      CALL ZHEEV('N', 'U', N, H, lda, energy, work, lwork, rwork, info)
      WRITE (17, '(f16.8,"  ",f16.8," ",f16.8,"  ",f16.8)') kx, ky, energy(1), energy(2)
    END DO
    WRITE (17,*)
  END DO

  CLOSE(17)
END PROGRAM Rashba


!=== ハミルトニアン================
SUBROUTINE Hamiltonian(kx,ky,Hamil)
  DOUBLE PRECISION    ::  kx, ky
  DOUBLE PRECISION    ::  alpha = 1.d0, lambda = 1.d0
  COMPLEX*16          ::  sig_x(2,2)=0.d0, sig_y(2,2)=0.d0, sig_z(2,2)=0.d0, sig_0(2,2)=0.d0
  COMPLEX*16          ::  Hamil(2,2)

  sig_x(1,2) = ( 1.d0, 0.d0)
  sig_x(2,1) = ( 1.d0, 0.d0)
  sig_y(1,2) = ( 0.d0,-1.d0)
  sig_y(2,1) = ( 0.d0, 1.d0)
  sig_z(1,1) = ( 1.d0, 0.d0)
  sig_z(2,2) = (-1.d0, 0.d0)
  sig_0(1,1) = ( 1.d0, 0.d0)
  sig_0(2,2) = ( 1.d0, 0.d0)

  Hamil = alpha*(kx**2+ky**2)*sig_0 + lambda*(kx*sig_y - ky*sig_x)
END SUBROUTINE
