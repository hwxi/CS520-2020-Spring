(* ****** ****** *)

dataprop
FIB(int, int) =
| FIB0(0, 0) // FIB0: FIB(0, 0)
| FIB1(1, 1) // FIB1: FIB(1, 1)
| {n:nat}
  {r0,r1:int}
  FIB2(n+2, r0+r1) of (FIB(n, r0), FIB(n+1, r1))

(* ****** ****** *)

extern
prfun
FIB_istot
{n:nat}
(): [r:int] FIB(n, r)
(*
prfun
FIB_istot
{n:nat}
.<n>.
(): [r:int] FIB(n, r) =
sif
(n==0)
then FIB0()
else
(
sif
(n==1)
then FIB1()
else FIB2(FIB_istot{n-2}(), FIB_istot{n-1}())
)
*)

(* ****** ****** *)

extern
prfun
FIB_isfun
{n:nat}
{r1,r2:int}
( pf1: FIB(n, r1)
, pf2: FIB(n, r2)): [r1 == r2] void
(*
prfun
FIB_isfun
{n:nat}
{r1,r2:int}
.<n>.
( pf1: FIB(n, r1)
, pf2: FIB(n, r2)): [r1 == r2] void =
(
case+
(pf1, pf2) of
| (FIB0(), FIB0()) => ()
| (FIB1(), FIB1()) => ()
| (FIB2(pf11, pf12), FIB2(pf21, pf22)) =>
  let
    val () = FIB_isfun(pf11, pf21)
    val () = FIB_isfun(pf12, pf22)
  in
    ()
  end
)
*)

(* ****** ****** *)

dataprop
FIBSUM(int, int) =
| FIBSUM0(0, 0) of ()
| {n:nat}{f,r:int}
  FIBSUM1(n+1, r+f) of
  (FIB(n+1, f), FIBSUM(n, r))
  
(* ****** ****** *)

prfun
FIBSUM_lemma
{n:nat}
{r,f:int}
.<n>.
( pf1
: FIBSUM(n, r)
, pf2
: FIB(n+2, f)): [r+1==f] void =
sif
(n==0)
then
let
val+ FIBSUM0() = pf1
val+ FIB2(FIB0(), FIB1()) = pf2
in
  ()
end
else
let
val+
FIBSUM1
(pf11(*f0*), pf12(*sum*)) = pf1
val+
FIB2(pf21(*f0*), pf22(*f1*)) = pf2
val () = FIBSUM_lemma{n-1}(pf12, pf22)
val () = FIB_isfun(pf11, pf21)
in
  ()
end // end of [FIBSUM_lemma]

(* ****** ****** *)

(* end of [FIB.dats] *)
