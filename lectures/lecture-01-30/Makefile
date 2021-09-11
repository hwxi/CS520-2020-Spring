######

PATSCC=\
$(PATSHOME)/bin/patscc

######

all:: fibo

######

fibo: \
fibo.dats; \
$(PATSCC) -o fibo fibo.dats

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c

######

cleanall:: clean
cleanall:: ; rm -f fibo

###### end of [Makefile] ######

