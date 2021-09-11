(* ****** ****** *)

(*
** Assign02
** It is due Thursday, the 13th of February, 2020
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
// SGN(n, i): i = (-1)^n
//
dataprop
SGN(int, int) =
  | SGN0(0, 1)
  | {n:nat}{i:int}
    SGN1(n+1, ~i) of SGN(n, i)
// end of [SGN]
//
(* ****** ****** *)
//
// FIB(n, r): fib(n) = r
//
dataprop
FIB(int(*n*), int(*r*)) =
|
FIB0 (0, 0)
|
FIB1 (1, 1)
|
{n:nat}{r0,r1:int}
FIB2 (n+2, r0+r1) of (FIB(n, r0), FIB(n+1, r1))
//
(* ****** ****** *)
//
extern
prfun // no proof needed
FIB_istot{n:nat}(): [r:int] FIB(n, r)
//
(* ****** ****** *)
//
extern
prfun // no proof needed
FIB_isfun
{n:nat}{r1,r2:int}
(pf1: FIB(n, r1), pf2: FIB(n, r2)): EQINT(r1,r2)
//
(* ****** ****** *)
(*
** Proving:
** 1 + 3 + 5 + ... + (2n+1) = (n+1)^2
*)
//
dataprop
SUMODD(int(*n*), int(*r*)) =
| SUMODD0 (0, 0) of ()
| {n:nat}{r:int}
  SUMODD1 (n+1, r+2*n+1) of SUMODD(n, r)
//
(* ****** ****** *)
//
// Please implement lemma_SUMODD
//
extern
prfun // 10 pts
lemma_SUMODD
{n:nat}
{r:int}(pf: SUMODD(n, r)): EQINT(r,n*n)
//
(* ****** ****** *)
//
// Cassini's formula:
// fib(n)*fib(n+2) + (-1)^n = (fib(n+1))^2
//
(* ****** ****** *)
//
// Please implement lemma_FIB_cassini
//
extern
prfun // 20 pts
lemma_FIB_cassini
{n:nat}
{f0,f1,f2:int}{s:int}
(
  FIB(n, f0), FIB(n+1, f1), FIB(n+2, f2), SGN(n, s)
) : [f0*f2 + s == f1*f1] void
//
(* ****** ****** *)

(* end of [assign02.dats] *)
