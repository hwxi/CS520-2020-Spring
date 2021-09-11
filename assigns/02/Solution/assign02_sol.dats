(* ****** ****** *)
//
#include "./../assign02.dats"
//
(* ****** ****** *)
(*
Please
implement yours proofs below:
*)
(* ****** ****** *)
//
primplmnt
lemma_SUMODD(pf0) =
(
case+ pf0 of
|
SUMODD0() => EQINT()
|
SUMODD1(pf1) =>
let
  prval EQINT() = lemma_SUMODD(pf1) in EQINT()
end // end of [SUMODD1]
)
//
(* ****** ****** *)
//
prfun
fibeq1
{m,n:nat}
{r1,r2,r3,r4:int} .<m>.
( pf1
: FIB(m, r1) // r1 = fib(m)
, pf2
: FIB(n, r2) // r2 = fib(n)
, pf3
: FIB(m+1, r3) // r3 = fib(m+1)
, pf4
: FIB(n+1, r4) // r4 = fib(n+1)
) : FIB(m+n+1, r1*r2+r3*r4) = (
//
sif
m > 0
then
let
prval
FIB2(pf30, pf31) = pf3
prval
EQINT() = FIB_isfun(pf1, pf31)
in
fibeq1{m-1,n+1}(pf30, pf4, pf31, FIB2(pf2, pf4))
end // end of [then]
else let
  prval FIB0() = pf1; prval FIB1() = pf3 in pf4
end // end of [else]
//
) (* end of [fibeq1] *)
//
(* ****** ****** *)

primplmnt
lemma_FIB_cassini
{n}
(
  pf0, pf1, pf2, pf3
) = let
//
prfun
fibeq2
{n:nat}{i:int}
{f0,f1,f2:int} .<n>.
(
  pf0: FIB (n, f0)
, pf1: FIB (n+1, f1)
, pf2: FIB (n+2, f2)
, pf3: SGN (n, i) // i = (-1)^n
) :
[
  f0*f2 + i == f1*f1
] void = (
//
sif
n > 0
then let
  prval
  SGN1(pf31) = pf3
  prval
  FIB2(pf11, pf12) = pf1
  prval EQINT() = FIB_isfun(pf0, pf12)
  prval pf_n_n = fibeq1(pf0, pf0, pf1, pf1)
  prval pf_1n_n1 = fibeq1(pf11, pf1, pf0, pf2)
  prval EQINT() = FIB_isfun(pf_n_n, pf_1n_n1)
  prval () = fibeq2{n-1}(pf11, pf12, pf1, pf31) // IH
in
  // nothing
end // end of [then]
else let
  prval SGN0() = pf3
  prval FIB0() = pf0
  prval FIB1() = pf1
  prval FIB2(FIB0(), FIB1()) = pf2
in
  // nothing
end // end of [else]
//
) (* end of [fibeq2] *)
//
in
  fibeq2{n}(pf0, pf1, pf2, pf3)
end // end of [fib_cassini]

(* ****** ****** *)

(*
//
// HX: this one works, too:
//
primplmnt
lemma_FIB_cassini
{n}(pf10, pf20, pf30, pf40) =
sif
(n==0)
then // base case
let
val+ FIB0() = pf10
val+ FIB1() = pf20
val+ FIB2(pf31, pf32) = pf30
val+ SGN0() = pf40
val+ EQINT() = FIB_isfun(pf10, pf31)
val+ EQINT() = FIB_isfun(pf20, pf32)
in
  ()
end
else // inductive case
let
val+ FIB2(pf21, pf22) = pf20
val+ FIB2(pf31, pf32) = pf30
val+ SGN1(pf41) = pf40
val+ EQINT() = FIB_isfun(pf10, pf22)
val+ EQINT() = FIB_isfun(pf10, pf31)
val+ EQINT() = FIB_isfun(pf20, pf32)
val+ () = lemma_FIB_cassini(pf21, pf22, pf20, pf41) // induction hypothesis
in
  ()
end // end of [lemma_FIB_cassini]
*)
          
(* ****** ****** *)

(* end of [assign02_sol.dats] *)
