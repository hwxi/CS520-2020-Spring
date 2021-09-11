//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
(*
A version of Permute is given at
https://github.com/githwxi/ATS-Postiats-test/blob/master/contrib/hwxi/CS520/Spring2015/lecture-03-16/permute.dats
*)
//
// HX-2015-10: 10 points
// Please modify the above version
// or implement one entirely on your own
//
extern
fun
Permute{n:nat}(n: int(n)): list0(list0(int))
//
(* ****** ****** *)
//
dataprop
FACT(int, int) =
  | FACTbas(0, 1) of ()
  | {n:pos}
    {r1:int}
    FACTind(n, n*r1) of FACT(n-1, r1)
//
(* ****** ****** *)
//
// HX-2015-10: 20 points
// Permute2 is does the same as Permute
// except for also producing a proof showing the
// length of the returned list is the n factorial 
//
extern
fun
Permute2
{n:nat}
(
  n: int(n)
) : [r:int] (FACT(n, r) | list(list(int, n), r))
//
(* ****** ****** *)
//
// HX: 10 points
// Note that permutations of 1,2,...,n can be ordered
// lexicographically. For instance, we have
//
// (1, 2, 3) < (1, 3, 2) <
// (2, 1, 3) < (2, 3, 1) <
// (3, 1, 2) < (3, 2, 1)
//
// Given a permutation xs of 1,2,...,n, Permute_next
// finds the next permutation immediately after xs or
// raises the LastPermException exception of xs is the
// last permutation (n, n-1, ..., 1). For instance,
// Permute_next((2, 3, 1)) returns (3, 1, 2) but
// Permute_next((3, 2, 1)) raises LastPermException.
//
// Using Permute_next to implement Permute is not allowed
//
exception LastPermException of ()
//
extern
fun
Permute_next(xs: list0(int)): list0(int)
//
(* ****** ****** *)

(* end of [Permute.dats] *)
