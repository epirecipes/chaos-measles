JULIA=julia
GNUPLOT=gnuplot

target = bruteforceSIR_R0

.PHONY: all

all: $(target).dat $(target).png

$(target).png: $(target).dat
	$(GNUPLOT) $(target).gnuplot

$(target).dat:
	$(JULIA) $(target).jl
	
clean:
	rm -f $(target).dat
	rm -f $(target).png