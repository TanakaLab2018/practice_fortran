PROGRAM Coupled_Vibration
  IMPLICIT NONE
  INTEGER,PARAMETER   ::  SIZE = 1024,  TIME_COUNT = 300
  DOUBLE PRECISION    ::  pi = atan(1.d0)*4.d0
  INTEGER             ::  i, j
  DOUBLE PRECISION    ::  x(SIZE) = 0, v(SIZE) = 0, C(SIZE,SIZE) = 0
  DOUBLE PRECISION    ::  x_buf(SIZE) = 0, v_buf(SIZE) = 0, C_buf(SIZE,SIZE) = 0, y(SIZE)=0
  DOUBLE PRECISION    ::  lambda = 1.d0, dt = 0.1d0, dx = 1.d0/dble(SIZE-1)
  CHARACTER           ::  filename*10000

  !係数行列Cの作成
  DO i = 1, SIZE
    C(i,i) = -2.d0
  END DO

  DO i = 1, SIZE-1
    C(i,i+1) = 1.d0
    C(i+1,i) = 1.d0
  END DO

  !速度の初期値はゼロとする
  !位置の初期値を与える(今回は正弦波)
  DO i = 1, SIZE
    x(i) = 0.5d0*sin(2.d0*pi*dble(i-1)*dx)
  END DO

  DO i = 1,TIME_COUNT
    !lapackに代入したベクトルや行列は変形してしまうため, bufを用いて計算を行うようにする.
    C_buf = C
    x_buf = x
    v_buf = v

    !連立微分方程式1
    x = x_buf + v_buf*dt
    !連立微分方程式2
    CALL DGEMV('N', SIZE, SIZE, 1.d0, C_buf, SIZE, x_buf, 1, 0.d0, y, 1)
    v = v_buf - lambda*x_buf*dt

    !書き出すファイル"plot_data000i.txt"を生成し, 出力
    WRITE(filename,'("plot_data",i4.4,".txt")') i
    OPEN (17, FILE=filename, STATUS='replace')
    DO j = 1, SIZE
      WRITE (17, '(f16.8,"  ",f16.8," ",f16.8)') dble(j-1)*dx, x(j), v(j)
    END DO

  END DO


END PROGRAM Coupled_Vibration
