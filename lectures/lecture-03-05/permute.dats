(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#staload "./main.sats"

(* ****** ****** *)

extern
fun{} wpermute(word): list0(word)

(* ****** ****** *)

extern
fun
{
a:t@ype
}
permute0
(xs: list0(INV(a))): list0(list0(a))

(* ****** ****** *)
//
extern
fun
{a:t@ype}
choose_1_rest
(xs: list0(INV(a))): list0(@(a, list0(a)))
//
implement
{a}(*tmp*)
choose_1_rest(xs) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x1, xs2) =>
  list0_cons
  (
    (x1, xs2)
  , list0_map<(a, list0(a))><(a, list0(a))>
      (choose_1_rest(xs2), lam(xxs) => (xxs.0, list0_cons(x1, xxs.1)))
    // list0_map
  )
)
//
implement
{a}(*tmp*)
permute0(xs) =
case+ xs of
| list0_nil() =>
  list0_sing
  (
    list0_nil()
  )
| list0_cons _ =>
  list0_concat
  (
    list0_map<(a, list0(a))><list0(list0(a))>
      (choose_1_rest(xs), lam(@(x, xs)) => list0_mapcons(x, permute0(xs)))
    // end of [list0_map]
  )
//
(* ****** ****** *)

implement
{}
wpermute(w0) = let
val cs = 
word_listize(w0)
val ccs = permute0(cs)
in
  list0_map(ccs, lam(cs) => word_unlistize(cs))
end // end of [wpermute]

(* ****** ****** *)

(* end of [permute.dats] *)
