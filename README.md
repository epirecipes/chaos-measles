# chaos-measles
Simulating chaotic dynamics in measles models

This repository contains code to try to reproduce models of chaotic dynamics in epidemiological models using Julia.

## `bolker1993`

This folder contains code written in C using Mumerical Recipes in C, in order to try to reproduce model runs from Bolker and Grenfell (1993).

## `krylova2013`

This folder contains code for the modeling software XPP-AUT, in order to try to reproduce the brute force model runs from Krylova and Earn (2013). The original XPP-AUT code was taken from the supplementary information, which can be found [here](https://royalsocietypublishing.org/action/downloadSupplement?doi=10.1098%2Frsif.2013.0098&file=rsif20130098supp2.pdf).

## Dependencies

- A C compiler (edit CC in the Makefile)
- Make
- Gnuplot for plotting
- XPP-AUT
- Julia with associated libraries
- The following Numerical Recipes files, for which you will need a license from [http://numerical.recipes/](http://numerical.recipes/)
    - nr.h
    - nutil.h
    - nutil.c
    - odeint.c
    - rkck.c
    - rkqs.c

## References

- Bolker, B.M. and Grenfell, B.T. (1993) Chaos and biological complexity in measles dynamics. Proc Biol Sci
 22:75-81. [doi:10.1098/rspb.1993.0011](ttp://dx.doi.org/10.1098/spb.1993.0011)
- Krylova, O. and Earn, D.J.D. (2013) Effects of the infectious period distribution on predicted transitions in childhood disease dynamics. J Roy Soc Interface 10:20130098 [doi:10.1098/rsif.2013.0098](http://dx.doi.org/10.1098/rsif.2013.0098)
