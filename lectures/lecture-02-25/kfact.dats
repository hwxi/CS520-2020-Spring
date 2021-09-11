(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fun
{ans:t@ype}
kfact
( x0: int
, k0: int -<cloref1> ans): ans =
if
x0 > 0
then
kfact(x0-1, lam(r) => k0(x0 * r))
else k0(1)

(* ****** ****** *)

implement
main0() =
{
  val () =
  kfact<void>
  (1000000, lam(r) => println!(r))
}

(* ****** ****** *)

(* end of [kfact.dats] *)
