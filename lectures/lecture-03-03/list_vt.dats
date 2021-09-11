(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
{a:t@ype}
list_vt_length :
{n:nat} (!list_vt(a, n)) -> int(n)

(* ****** ****** *)

implement
{a}
list_vt_length{n}
  (xs) = loop(xs, 0) where
{
fun
loop
{i,j:nat | i+j==n}
(xs: !list_vt(a, i), n: int(j)): int(n) =
case+ xs of
| list_vt_nil() => n
| list_vt_cons(_, xs) => loop(xs, n+1)
}

(* ****** ****** *)

(* end of [list_vt.dats] *)
