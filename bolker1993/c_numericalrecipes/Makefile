CC=gcc
CFLAGS=-O3
LDFLAGS=
GNUPLOT=gnuplot

sources = nrutil.c rkqs.c rkck.c odeint.c sirforced.c
target = sirforced

.PHONY: all

all: $(target) $(target).dat $(target).png

$(target).png: $(target).dat
	$(GNUPLOT) $(target).gnuplot

$(target).dat: $(target)
	./$(target)

$(target): $(sources)
	$(CC) $(CFLAGS) $(sources) -o $(target)
	
clean:
	rm -f $(target)
	rm -f $(target).dat
	rm -f $(target).png