#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: assign01

######

cleanall:: clean

######

assign01: ; \
$(PATSCC) -tcats assign01_sol.dats

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.o *_dats.c

######

###### end of [Makefile] ######
