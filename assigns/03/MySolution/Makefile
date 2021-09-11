###### beg of [Makefile] ######

PATSCC=\
patscc \
-atsccomp "gcc" \
-I${PATSHOME} \
-I${PATSHOME}/ccomp/runtime

######

all:: \
assign03_sol_dats

######

assign03_sol_dats: \
assign03_sol.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c
clean:: ; rm -f *_dats.o

cleanall:: clean
cleanall:: ; rm -f assign03_sol_dats

###### end of [Makefile] ######
