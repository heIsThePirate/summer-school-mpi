#set logscale y
set logscale x
set xtics ("0" 0, "64" 64, "1K" 1024, "4K" 4096, "16K" 16384, "64K" 65536, "256K" 262144, "1M" 1048576, "4M" 4194304, "16M" 16777216, "64M" 67108864, "256M" 268435456)
set ylabel "MB/sec"
set xlabel "Message sizes"
plot 'bwd.dat' using 1:3 with linespoints title 'Bandwidth'
pause -1
