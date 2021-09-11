(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

fun
listprod
(xs: list0(int)): int =
(
case+ xs of
| list0_nil() => 1
| list0_cons(x0, xs) => x0 * listprod(xs)
)

(* ****** ****** *)

fun
listprod
(xs: list0(int)): int =
(
case+ xs of
| list0_nil() => 1
| list0_cons(x0, xs) =>
  if x0 = 0 then 0 else x0 * listprod(xs)
)

(* ****** ****** *)

fun
listprod
(xs: list0(int)): int =
let

exception ZERO of ()

fun
auxlist
(xs: list0(int)): int =
(
case+ xs of
| list0_nil() => 1
| list0_cons(x0, xs) =>
  if
  x0 = 0
  then $raise ZERO else x0 * listprod(xs)
)

in
   try auxlist(xs) with ~ZERO() => 0
end

(* ****** ****** *)

val long_list =
(
  loop(1000, list0_nil())
) where
{
fun
loop
( i: int
, res: list0(int)): list0(int) =
if i > 0
then
loop(i-1, list0_cons(i, res)) else res
}

(* ****** ****** *)

#define :: list0_cons

implement
main0() =
{
  val ans =
  listprod(0 :: long_list)
  val ( ) = println!("ans = ", ans)
}

(* ****** ****** *)

(* end of [listprod.dats] *)
