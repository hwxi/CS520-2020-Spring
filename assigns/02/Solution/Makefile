#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: assign02

######

cleanall:: clean

######

assign02: ; \
$(PATSCC) -tcats assign02_sol.dats

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.o *_dats.c

######

###### end of [Makefile] ######
