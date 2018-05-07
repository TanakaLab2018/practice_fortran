gfortran ./Rashba_bry.f90 -lm -lblas -llapack -o sample
Write-Host "Compile completed"

.\sample.exe

Write-Host "Creating the gif file"

gnuplot -e "
 set terminal png;
 set output 'Rashba_bry.png';
 set pm3d;
 splot "date1.txt" w l, "date2.txt" w l
  "
Write-Host "Created the 'movie.gif'"

rm .\sample.exe
