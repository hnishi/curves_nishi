
#### Makefile for Cur+ ####

CC= cc
CFLAG= 

FC= gfortran
#FFLAG= -w -fbounds-check
FFLAG= -w -O2

OBJ= aacur.o axis.o axref.o backbo.o bisection.o dotdelta.o eigen.o \
findaxis.o getdate.o ionbld.o ionpar.o input.o intaxe.o intop.o \
locate.o ligloc.o ligpar.o lsfit.o lslig.o manta.o nml.o params.o \
pdbout.o screw.o setup.o smooth.o torp.o

Cur+ :  $(OBJ)
	$(FC) $(FFLAG) $(OBJ) -o Cur+

.SUFFIXES : .o .c .f
.c.o :
	$(CC) $(CFLAG) -c $<

.f.o :
	$(FC) $(FFLAG) -c $<
