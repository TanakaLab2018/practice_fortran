#!/usr/bin/env bash
gfortran sample.f90
gnuplot -e "
  load 'make_gif.plt';
  "
