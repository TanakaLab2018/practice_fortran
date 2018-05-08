Write-Host "make movie of the vibra_bry.f90"

gfortran ./vibra_bry.f90 -lm -lblas -llapack -o vibra
Write-Host "Compile completed"

.\vibra.exe

Write-Host "Creating the gif file"

gnuplot -e "
  load 'make_gif.plt';
  "
Write-Host "Created the 'movie.gif'"

rm .\vibra.exe
rm *.txt
