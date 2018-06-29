unset key
set size square
set size 0.8, 0.8
#set pm3d map
set terminal png
#set palette defined (0 "black", 0.01 "blue", 0.02 "purple", 0.2 "red", 0.5 "yellow", 1 "white")
#set xrange[-0.2:0.2]
set yrange[0.0:120.0]
#set cbrange[0:0.6]
set output 'data.png'
plot      '../data.txt' w l pt 0
exit gnuplot
