#! /usr/bin/
gfortran rashbaKS.f90 -lm -lblas -llapack -o rashbaKS.out
./rashbaKS.out

gnuplot -e "
  set view 100,20,1,1;
  splot 'rashbaKS.txt' u 1:2:3 , 'rashbaKS.txt' u 1:2:4;
"
