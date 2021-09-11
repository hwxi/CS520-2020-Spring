(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

typedef
kf
( a:t@ype
, r:t@ype) = (a) -<cloref1> r

fun
kfact
( x0: int
, k0: kf(int, void)): void =
if
x0 > 0
then
kfact(x0-1, lam(r) => k0(x0 * r))
else k0(1)

(* ****** ****** *)

implement
main0() =
{
(*
val k0 =
lam(r: int): void =<cloref1> println!(r)
*)
  val () = kfact(10, lam(r) => println!(r))
}

(* ****** ****** *)

(* end of [kfact.dats] *)
