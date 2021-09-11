#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
MYATSCC=$(PATSHOME)/bin/myatscc

######

SUM: ; \
$(PATSCC) -tcats SUM.dats

POW2: POW2.dats ; $(PATSCC) -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.o *_dats.c

######

cleanall:: clean
cleanall:: ; rm -f POW2

###### end of [Makefile] ######
