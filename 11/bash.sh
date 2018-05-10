#! /usr/bin/
gfortran vibKS.f90 -lm -lblas -llapack -o vibKS.out
./vibKS.out

gnuplot -e "
  set yrange [-1:1];

  plot for [i=1:7]  'vibKS.txt' u i w l ;

 set terminal png;
 set output 'outKS.png';
 replot;
 "

rm ./vibKS.out
