(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

fun
stream_vt_from
(i: int): stream_vt(int) =
$ldelay
(stream_vt_cons(i, stream_vt_from(i+1)))

(* ****** ****** *)

fun
sieve_vt
(xs: stream_vt(int)): stream_vt(int) =
$ldelay
(
let
  val-
  ~stream_vt_cons(x0, xs) = !xs
in
  stream_vt_cons
  (x0, sieve_vt(remove(xs))) where
  {
    fun
    remove
    (xs: stream_vt(int)): stream_vt(int) =
    $ldelay
    (
    let
      val-
      ~stream_vt_cons(x1, xs) = !xs
    in
      if
      x1 % x0 > 0
      then stream_vt_cons(x1, remove(xs))
      else !(remove(xs))
    end
    ,
    ~xs
    )
  }
end
,
~xs
)

fun
f_thePrimes() = sieve_vt(stream_vt_from(2))

fun
{a:t@ype}
stream_vt_nth
(xs: stream_vt(a), n: int): a =
(
  auxmain(xs, 0)
) where
{
fun
auxmain
(xs: stream_vt(a), i: int): a =
(
case- !xs of
~stream_vt_cons(x0, xs) =>
if i < n then auxmain(xs, i+1) else (~xs; x0)
)
} (* end of [stream_vt_nth] *)

val
p5000 =
stream_vt_nth<int>(f_thePrimes(), 5000)
val () = println!("p5000 = ", p5000)

val
p5001 =
stream_vt_nth<int>(f_thePrimes(), 5001)
val () = println!("p5001 = ", p5001)

implement main0()  =  ()