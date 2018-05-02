# helloworld in PowerShell
Write-Host "make movie of the sample.f90"
gfortran ./sample.f90 -lm -lblas -llapack -o sample
Write-Host "Compile completed"
.\sample.exe

gnuplot -e "
  load 'make_gif.plt';
  "
Write-Host "Created the 'movie.gif'"
