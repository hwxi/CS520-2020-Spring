(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

(*
datatype
stream_con
  (a:t@ype+) =
//
// t@ype+: covariant
//
  | stream_nil of ((*void*))
  | stream_cons of (a, stream(a))
//
where stream (a:t@ype) = lazy (stream_con(a))
//
*)

(* ****** ****** *)

fun
stream_from
(i: int): stream(int) =
$delay
(
stream_cons(i, stream_from(i+1))
)

(* ****** ****** *)

val theNats = stream_from(0)

(* ****** ****** *)

val xs = theNats
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)
val-stream_cons(x, xs) = !xs
val () = println!("x = ", x)

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [stream.dats] *)
