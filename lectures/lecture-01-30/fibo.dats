(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

(*
fun fibo(n) =
if n >= 2
then fibo(n-2) + fibo(n-1) else n
*)

(*
FIB(0, 0)
FIB(1, 1)
(FIB(n, r0), FIB(n+1, r1)) -> FIB(n+2, r0+r2)
*)

(* ****** ****** *)

dataprop
FIB(int, int) =
| FIB0(0, 0) // FIB0: FIB(0, 0)
| FIB1(1, 1) // FIB1: FIB(1, 1)
| {n:nat}
  {r0,r1:int}
  FIB2(n+2, r0+r1) of (FIB(n, r0), FIB(n+1, r1))
  
(* ****** ****** *)

fun
fibo
{n:nat}
.<n>.
(x: int(n)):
[r:int]
(FIB(n, r) | int(r)) =
if
(x = 0)
then (FIB0() | 0)
else
(
if
(x = 1)
then (FIB1() | 1)
else
let
val res0 = fibo(x-2)
val res1 = fibo(x-1)
in
  (FIB2(res0.0, res1.0) | res0.1 + res1.1)
end
)

(* ****** ****** *)

implement
main0() =
let
val res0 = fibo(10)
in
  println!("fibo(10) = ", res0.1)
end

(* ****** ****** *)

(* end of [fibo.dats] *)
