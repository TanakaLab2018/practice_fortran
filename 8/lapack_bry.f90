program index
  implicit none
  double precision a(2*2),x(2),b(2*2),lworko,work(2)
  integer n,lwork,info
  write(*,*) "Ax=λBx call x"
  n=2
  lwork=2
  a(1)=3.0
  a(2)=-1.0
  a(3)=-1.0
  a(4)=3.0
  write(*,*) "index A"
  write(*,*) a(1),a(3)
  write(*,*) a(2),a(4)
  b(1)=1.0
  b(2)=0.0
  b(3)=0.0
  b(4)=1.0
  write(*,*) "index B"
  write(*,*) b(1),b(3)
  write(*,*) b(2),b(4)

  call dsygv(1,'V','U',n,a,n,b,n,x,lwork,-1,info)
  call dsygv(1,'V','U',n,a,n,b,n,x,work,lwork,info)

  write(*,*) "eigenvalue vector x"
  write(*,*) x(1),x(2)

  write(*,*) "example completed."

end program index
