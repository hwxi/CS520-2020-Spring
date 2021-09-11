(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

fun
stream_from
(i: int): stream(int) =
$delay
(stream_cons(i, stream_from(i+1)))

(* ****** ****** *)

fun
sieve
(xs: stream(int)): stream(int) =
$delay
(
let
  val-
  stream_cons(x0, xs) = !xs
in
  stream_cons
  (x0, sieve(remove(xs))) where
  {
    fun
    remove
    (xs: stream(int)): stream(int) =
    $delay
    (
    let
      val-
      stream_cons(x1, xs) = !xs
    in
      if
      x1 % x0 > 0
      then stream_cons(x1, remove(xs))
      else !(remove(xs))
    end
    )
  }
end
)

val
thePrimes = sieve(stream_from(2))

fun
{a:t@ype}
stream_nth
(xs: stream(a), n: int): a =
(
  auxmain(xs, 0)
) where
{
fun
auxmain
(xs: stream(a), i: int): a =
(
case- !xs of stream_cons(x0, xs) => if i < n then auxmain(xs, i+1) else x0
)
} (* end of [stream_nth] *)

val
p5000 =
stream_nth<int>(thePrimes, 5000)
val
p5001 =
stream_nth<int>(thePrimes, 5001)
val () = println!("p5000 = ", p5000)
val () = println!("p5001 = ", p5001)

implement main0()  =  ()