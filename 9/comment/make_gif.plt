reset
set term gif animate optimize delay 2 size 480, 360
set output 'movie.gif'

set xrange[0:1]
set yrange[-0.5:0.5]

do for [i=1:300]{
  filename = sprintf("plot_data%04d.txt",i)
  plot filename w l
  }

set out
set terminal windows
