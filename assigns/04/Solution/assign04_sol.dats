(* ****** ****** *)
//
#include "./../assign04.dats"
//
(* ****** ****** *)

implement
{ans}
kfibo1(x0, k0) =
if
(x0 >= 2)
then
kfibo1
( x0-2
, lam r2 =>
  kfibo1
  ( x0-1
  , lam r1 => k0(r2+r1))
)
else k0(x0) // end of [if]

(* ****** ****** *)

implement
{ans}
kfibo2{n}{r}
(pf | x0, k0) =
if
(x0 >= 2)
then
let
prval
FIB2(pf2, pf1) = pf
in
kfibo2
( pf2
| x0-2
, lam r2 =>
  kfibo2
  ( pf1
  | x0-1
  , lam r1 => k0(r2+r1)
  )
)
end
else
(
if
(x0 = 0)
then
let
prval FIB0() = pf in k0(x0) end
else
let
prval FIB1() = pf in k0(x0) end
) (* end of [kfibo2] *)

(* ****** ****** *)

implement main0() = ((*dummy*))

(* ****** ****** *)

(* end of [assign04_sol.dats] *)
