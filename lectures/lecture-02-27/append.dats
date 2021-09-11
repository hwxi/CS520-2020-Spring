(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

extern
fun
{a:t@ype}
list0_append
( xs: list0(a)
, ys: list0(a)): list0(a)

implement
{a:t@ype}
list0_append
  (xs, ys) =
(
  append(xs)
) where
{
fun
append(xs: list0(a)): list0(a) =
case+ xs of
| list0_nil() => ys
| list0_cons(x0, xs) => list0_cons(x0, append(xs))
}

extern
fun
{a:t@ype}
list0_reverse
(xs: list0(a)): list0(a)
extern
fun
{a:t@ype}
list0_rappend
( xs: list0(a)
, ys: list0(a)): list0(a)

implement
{a:t@ype}
list0_rappend
  (xs, ys) =
(
  rappend(xs, ys)
) where
{
fun
rappend
( xs: list0(a)
, ys: list0(a)): list0(a) =
case+ xs of
| list0_nil() => ys
| list0_cons(x0, xs) => rappend(xs, list0_cons(x0, ys))
}

implement
{a:t@ype}
list0_reverse(xs) =
list0_rappend(xs, list0_nil())

implement
{a:t@ype}
list0_append
  (xs, ys) =
  list0_rappend(list0_reverse(xs), ys)

(* ****** ****** *)

extern
fun
{a:t@ype}
stream_append
( xs: stream(a)
, ys: stream(a)): stream(a)

(* ****** ****** *)

(*
This is a FULLY lazy implementation!!!
*)
implement
{a:t@ype}
stream_append
  (xs, ys) =
(
  append(xs)
) where
{
fun
append
(xs: stream(a)): stream(a) =
$delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x0, xs) =>
  stream_cons(x0, append(xs))
)
}

(*
(*
This is not a FULLY lazy implementation!!!
*)
implement
{a:t@ype}
stream_append
  (xs, ys) =
(
  append(xs)
) where
{
fun
append
(xs: stream(a)): stream(a) =
(
case+ !xs of
| stream_nil() => ys
| stream_cons(x0, xs) =>
  $delay(stream_cons(x0, append(xs)))
)
}
*)

(* ****** ****** *)