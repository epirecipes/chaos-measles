set terminal pngcairo enhanced font "arial,12" fontscale 4.0 size 2400, 1600

set output 'bruteforceSIR_R0.png'

set xlabel "R0"
set ylabel "log I"

set yrange [-6:-2]

unset key

# plot the input file using the line styles defined above
plot 'bruteforceSIR_R0.dat' u 4:6