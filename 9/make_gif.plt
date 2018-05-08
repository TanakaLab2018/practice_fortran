reset
set term gif animate optimize delay 2 size 480, 360
set output 'movie.gif'

set xrange[0:1]
set yrange[-4:4]

do for [i=1:1000]{
  filename = sprintf("plot_date%04d.txt",i)
  #filename = sprintf("plot_data%04d.txt",i)
  plot filename w l
  }

set out
