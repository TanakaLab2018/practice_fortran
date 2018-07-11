program randam
    implicit none
    integer :: k,clock,nRand,x
    integer,allocatable :: seed(:)
    real(4) :: rand(100)
    
    x=0.0d0
!乱数決める
    call RANDOM_SEED(size=nRand)
    ALLOCATE(seed(nRand))
    call SYSTEM_CLOCK(count=clock)
    seed=clock
    call RANDOM_SEED(put=seed)
    call RANDOM_NUMBER(rand)
    rand=rand*10
    x=int(rand(3))
!乱数表示
    write(*,*) x

end program randam

