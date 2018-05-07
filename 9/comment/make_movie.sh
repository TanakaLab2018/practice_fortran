#! /bin/sh
echo "make movie of the sample.f90"

gfortran ./sample.f90 -lm -lblas -llapack -o sample
echo "Compile completed"

./sample

echo "Creating the gif file"
gnuplot -e "
  load 'make_gif.plt';
  "
echo "Created the 'movie.gif'"

rm ./sample
rm *.txt
