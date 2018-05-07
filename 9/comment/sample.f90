PROGRAM Coupled_Vibration
  IMPLICIT NONE
  INTEGER,PARAMETER   ::  SIZE = 1024,  TIME_COUNT = 1000000
  DOUBLE PRECISION    ::  pi = atan(1.d0)*4.d0
  INTEGER             ::  i, j, RANGE
  DOUBLE PRECISION    ::  x(SIZE) = 0, v(SIZE) = 0, C(SIZE,SIZE) = 0
  DOUBLE PRECISION    ::  x_old(SIZE) = 0, v_old(SIZE) = 0, y(SIZE)=0
  DOUBLE PRECISION    ::  lambda = 10.d0, dt = 0.1d0, dx = 1.d0/dble(SIZE-1)
  CHARACTER           ::  filename*1000

  !動画を全部で1000フレームにしたい
  RANGE = TIME_COUNT/1000

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
    x(i) = 0.5d0*sin(2.d0*pi*dble(i-1)*dx)/(dble(i)*dx)
  END DO

  DO i = 1,TIME_COUNT
    !新しく更新してまうためoldを用いて計算を行うようにする.
    x_old = x
    v_old = v

    !連立微分方程式2
    CALL DGEMV('N', SIZE, SIZE, 1.d0, C, SIZE, x_old, 1, 0.d0, y, 1)
    v = v_old + lambda*y*dt
    !連立微分方程式1
    x = x_old + v*dt

    !i/RANGEごとにファイルを出力することで, 全体で1000フレームにしている.
    IF ( MOD(i,RANGE) == 0) THEN
      PRINT '(a,i4)', "Writing the txt file --- No.", i/RANGE
      !書き出すファイル"plot_data000i.txt"を生成し, 出力
      WRITE(filename,'("plot_data",i4.4,".txt")') i/RANGE
      OPEN (17, FILE=filename, STATUS='replace')
      DO j = 1, SIZE
        WRITE (17, '(f16.8,"  ",f16.8," ",f16.8)') dble(j-1)*dx, x(j), v(j)
      END DO
    END IF

  END DO


END PROGRAM Coupled_Vibration
