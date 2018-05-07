program ra
  implicit none
  integer,parameter  :: size=31,n=2
  integer,parameter  :: lda=n,lwork=10*n
  double precision   :: M_Pi=atan(1.d0)*4.d0
  double precision   :: kx,ky,dk=2d0*atan(1.d0)*4.d0/dble(size-1),rwork(3*n-2), energy(n)
  integer            :: info,i,j
  complex*16         :: h(n,n),work(lwork)

  open(17,file='date1.txt',status='replace')
  open(18,file='date2.txt',status='replace')
  do i=1,size
    kx=(dk*dble(i-1)-M_Pi)*0.1d0
    do j=1,size
      ky = (dk*dble(j-1) - M_Pi)*0.1d0
      call hamiltonian(kx,ky,h)
      call zheev('N','U',n,h,lda,energy,work,lwork,rwork,info)
      write(17, '(f16.8,"  ",f16.8," ",f16.8)') kx,ky,energy(1)
      write(18, '(f16.8,"  ",f16.8," ",f16.8)') kx,ky,energy(2)
    end do
    write(17,*)
    write(18,*)
  end do
  close(17)
  close(18)

end program ra

!==ハミルトニアンについて==
subroutine hamiltonian(kx,ky,hamil)
  double precision   :: kx,ky
  double precision   :: alpha=1.d0,lambda=1.d0,m=0.05d0
  complex*16         :: sig_x(2,2)=0.d0, sig_y(2,2)=0.d0, sig_z(2,2)=0.d0, sig_0(2,2)=0.d0
  complex*16         :: hamil(2,2)
  sig_x(1,2) = ( 1.d0, 0.d0)
  sig_x(2,1) = ( 1.d0, 0.d0)
  sig_y(1,2) = ( 0.d0,-1.d0)
  sig_y(2,1) = ( 0.d0, 1.d0)
  sig_z(1,1) = ( 1.d0, 0.d0)
  sig_z(2,2) = (-1.d0, 0.d0)
  sig_0(1,1) = ( 1.d0, 0.d0)
  sig_0(2,2) = ( 1.d0, 0.d0)
  hamil = alpha*(kx**2+ky**2)*sig_0 + lambda*(kx*sig_y - ky*sig_x) + m*sig_z
end subroutine
