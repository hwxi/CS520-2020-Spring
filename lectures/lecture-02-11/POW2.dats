(* ****** ****** *)

#include
"share/atspre_staload.hats"

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
dataprop
POW2(int, int) =
  | POW2bas(0, 1) // of ()
  | {n:nat}
    {r:int}
    POW2ind(n+1, 2*r) of POW2(n, r)
//
(* ****** ****** *)

extern
fun
pow2
{n:nat}
(x: int(n)): [r:int] (POW2(n, r) | int(r))

(* ****** ****** *)

implement
pow2(x) =
if
x = 0
then
(POW2bas() | 1)
else
(pf | r1 + r1) where
{
  val
  (pf1 | r1) =  pow2(x-1)
  prval pf = POW2ind(pf1)
}

(* ****** ****** *)

implement
main0() =
{
  val (pf | r) = pow2(10)
  val () = println!("pow2(10) = ", r)
}

(* ****** ****** *)

(* end of [POW2.dats] *)
