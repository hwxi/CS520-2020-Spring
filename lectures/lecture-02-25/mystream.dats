(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
fun
list_from
(i: int): list0(int) =
list_cons(i, list_from(i+1))
*)

(* ****** ****** *)

datatype
mystream(a:t@ype) =
mystream_cons of
(a, () -<cloref1> mystream(a))

fun
mystream_from
(i: int): mystream(int) =
mystream_cons(i, lam() => mystream_from(i+1))

(* ****** ****** *)

val
theNats = mystream_from(0)

(* ****** ****** *)

val xs = theNats
val mystream_cons(x, fxs) = xs
val () = println!("x = ", x)
val mystream_cons(x, fxs) = fxs()
val () = println!("x = ", x)
val mystream_cons(x, fxs) = fxs()
val () = println!("x = ", x)
val mystream_cons(x, fxs) = fxs()
val () = println!("x = ", x)
val mystream_cons(x, fxs) = fxs()
val () = println!("x = ", x)
val mystream_cons(x, fxs) = fxs()
val () = println!("x = ", x)
val mystream_cons(x, fxs) = fxs()
val () = println!("x = ", x)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [mystream.dats] *)
