Write-Host "make movie of the sample.f90"

gfortran ./sample.f90 -lm -lblas -llapack -o sample
Write-Host "Compile completed"

.\sample.exe

Write-Host "Creating the gif file"

gnuplot -e "
  load 'make_gif.plt';
  "
Write-Host "Created the 'movie.gif'"

rm .\sample.exe
rm *.txt
