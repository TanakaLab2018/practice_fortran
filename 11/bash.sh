#! /usr/bin/
gfortran vibKS.f90 -lm -lblas -llapack -o vibKS.out
./vibKS.out

gnuplot -e "
  set yrange [-1:1];
 plot 'vibKS.txt'  w l ;
 "
