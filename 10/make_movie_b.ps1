gfortran ./Rashba_bry.f90 -lm -lblas -llapack -o sample
Write-Host "Compile completed"

.\sample.exe

gnuplot -e "
   set pm3d;
   splot 'date1.txt' w l, 'date2.txt' w l;
   pause -1;
   set terminal png size 480, 360;
   set output 'Rashba_bry.png';
   splot 'date1.txt' w l, 'date2.txt' w l;
   set out;
  "
rm .\sample.exe


Write-Host "Finished"
