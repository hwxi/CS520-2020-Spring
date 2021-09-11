(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fun
{ans:t@ype}
kf91
( x0: int
, k0: int -<cloref1> ans): ans =
if
(x0 > 100)
then k0(x0 - 10)
else kf91(x0+11, lam r0 => kf91(r0, k0))

(* ****** ****** *)

implement
main0() =
{
  val () =
  kf91<void>(10, lam(r) => println!(r))
}

(* ****** ****** *)

(* end of [kf91.dats] *)
