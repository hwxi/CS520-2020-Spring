(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype
STEP(ans:t@ype) =
| DONE of (ans)
| FACT of (int, int -<cloref1> STEP(ans))

(* ****** ****** *)

fun
{ans:t@ype}
fact_step
( n0: int
, k0: int -<cloref1> STEP(ans)): STEP(ans) =
(
  if
  n0 > 0
  then
  FACT(n0-1, lam(r0) => k0(n0 * r0)) else k0(1)
)

(* ****** ****** *)

fun
{ans:t@ype}
step_eval
(step: STEP(ans)): STEP(ans) =
(
case+ step of
|
DONE(r0) => step
|
FACT(n0, k0) =>
let
val () =
println!
("FACT(", n0, ")") in fact_step(n0, k0)
end
)

(* ****** ****** *)

fun
{ans:t@ype}
step_meval
( step
: STEP(ans))
: stream_vt_con(STEP(ans)) =
stream_vt_cons
(step, $ldelay(step_meval(step_eval(step))))


fun
{ans:t@ype}
fact_stepize
(n0: int): stream_vt(STEP(int)) =
$ldelay
(
step_meval(FACT(n0, lam(res) => DONE(res)))
)

(* ****** ****** *)

fun
{ans:t@ype}
stream_get_ans
(xs: stream_vt(STEP(ans))): ans =
(
case- !xs of
|
~stream_vt_cons(x0, xs) =>
(
case+ x0 of
| DONE(r0) => (~xs; r0) | _ => stream_get_ans(xs))
)

(* ****** ****** *)

fun
fact(n0: int): int =
stream_get_ans(fact_stepize(n0))

(* ****** ****** *)

implement
main0 () = println!("fact(10) = ", fact(10))

(* ****** ****** *)

(* end of [README.dats] *)
