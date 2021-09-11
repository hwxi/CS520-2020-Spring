######

PATSCC=\
$(PATSHOME)/bin/patscc

######

all:: kf91
all:: kfact

######

kf91: \
kf91.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o kf91 kf91.dats
kfact: \
kfact.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o kfact kfact.dats

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c

######

cleanall:: clean
cleanall:: ; rm -f kf91
cleanall:: ; rm -f kfact

###### end of [Makefile] ######

