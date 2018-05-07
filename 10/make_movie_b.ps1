gfortran ./Rashba_bry.f90 -lm -lblas -llapack -o sample
Write-Host "Compile completed"

.\sample.exe

Write-Host "Creating the gif file"

gnuplot -e "
 set pm3d;
 set terminal png optimize delay 2 size 480, 360;
 set output 'Rashba_bry.png';
 splot "date1.txt" w l, "date2.txt" w l;
 set out;
  "
Write-Host "Created the 'movie.gif'"

rm .\sample.exe
