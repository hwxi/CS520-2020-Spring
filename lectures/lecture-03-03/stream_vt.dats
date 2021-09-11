(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
{a:t@ype}
stream_vt_length : stream_vt(a) -> int

(* ****** ****** *)

implement
{a}
stream_vt_length
  (xs) = loop(xs, 0) where
{
fun
loop(xs: stream_vt(a), n: int): int =
case+ !xs of
| ~stream_vt_nil() => n
| ~stream_vt_cons(_, xs) => loop(xs, n+1)
}

(* ****** ****** *)

(* end of [stream_vt.dats] *)
