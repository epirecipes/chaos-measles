set terminal pngcairo enhanced font "arial,12" fontscale 4.0 size 2400, 1600

set output 'sirforced.png'

set style line 1 linewidth 3 linecolor rgb "black"

set xlabel "time / years"
set ylabel "infectives"

set yrange [0:600000]

unset key

# plot the input file using the line styles defined above
plot 'sirforced.dat' u 1:4 w lines ls 1 notitle