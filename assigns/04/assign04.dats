(* ****** ****** *)

(*
** Assign04
** It is due Thursday,
** the 27th of February, 2020
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

(*
fun
fibo(x0) =
if
(x0 >= 2)
then fibo(x0-1) + fibo(x0-2) else x
*)
//
// HX: 10 points
// Please give an implementation of
// the function [fibo1] in CPS-style:
//
extern
fun
{ans:t@ype}
kfibo1
(x0: int, k0: (int) -<cloref1> ans): ans

(* ****** ****** *)
//
// FIB(n, r): fib(n) = r
//
dataprop
FIB(int(*n*), int(*r*)) =
|
FIB0(0, 0)
|
FIB1(1, 1)
|
{n:nat}{r0,r1:int}
FIB2(n+2, r0+r1) of
(FIB(n, r0), FIB(n+1, r1))
//
(* ****** ****** *)
//
// HX: 20 points
//
// Please given a tail-recursive
// implementation of the following declared
// function [fibo_tr]:
//
extern
fun
fibo_tr
{n:nat}
(x0: int(n)): [r:int] (FIB(n, r) | int(r))
//
(* ****** ****** *)
//
//
// HX: 10 points
// Please given an implementation of the
// following declared function [kfibo2]
//
extern
fun
{ans:t@ype}
kfibo2
{n:nat}{r:int}
(
pf: FIB(n, r) |
x0: int(n), k0: (int(r)) -<cloref1> ans): ans
//
(* ****** ****** *)

(* end of [assign04.dats] *)
