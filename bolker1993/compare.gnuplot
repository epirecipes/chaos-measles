set terminal pngcairo enhanced font "arial,12" fontscale 4.0 size 2400, 1600

set output 'compare.png'

set style line 1 linewidth 3 linecolor rgb "red"
set style line 2 linewidth 3 linecolor rgb "blue"

set yrange [0:600000]

set xlabel "Time"
set ylabel "Number"

# plot the input file using the line styles defined above
plot './c/sirforced.dat' u 1:4 w lines ls 1 title "C",\
    './julia/sirforced.dat' u 1:4 w lines ls 2 title "Julia"