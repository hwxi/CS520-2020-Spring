###### beg of [Makefile] ######

PATSCC=\
patscc \
-atsccomp "gcc" \
-I${PATSHOME} \
-I${PATSHOME}/ccomp/runtime

######

all:: \
assign04_sol_dats

######

assign04_sol_dats: \
assign04_sol.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c
clean:: ; rm -f *_dats.o

cleanall:: clean
cleanall:: ; rm -f assign04_sol_dats

###### end of [Makefile] ######
