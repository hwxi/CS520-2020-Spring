(* ****** ****** *)

(*
** Assign03
** It is due Thursday, the 20th of February, 2020
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype
tree(a:t@ype) =
| tree_nil(a) of ()
| tree_cons(a) of (tree(a), a, tree(a))

(* ****** ****** *)

fun
{a:t@ype}
height(t0: tree(a)): int =
(
case+ t0 of
| tree_nil() => 0
| tree_cons(tl, _, tr) => 1+max(height(tl), height(tr))
)

(* ****** ****** *)

fun
{a:t@ype}
isAVL1
( t0
: tree(a)): bool =
( test(t0) ) where
{
fun
test(t0: tree(a)): bool =
case+ t0 of
| tree_nil() => true
| tree_cons(tl, _, tr) =>
  if
  test(tl) && test(tr)
  then (abs(height(tl) - height(tr)) <= 1) else false
}

(* ****** ****** *)

extern
fun
{a:t@ype}
isAVL2(t0: tree(a)): bool

(* ****** ****** *)

(*
//
// HX-2020-02-15: 20 points
//
Please give a one-pass implementation
of isAVL2 such that isAVL1(t0) = isAVL2(t0)
for any values of the type tree.
*)

(* ****** ****** *)

macdef
tree_sing(x) =
tree_cons(tree_nil(), ,(x), tree_nil())

(* ****** ****** *)

(*
implement
main0() =
{
//
val () =
println!
("Hello from [Assign03]!")
//
val t0 =
tree_cons
(tree_cons(tree_sing(1), 2, tree_sing(3)), 4, tree_sing(5))
// val () = assertloc(isAVL1(t0))
// val () = assertloc(isAVL2(t0))
}
*)

(* ****** ****** *)

(* end of [assign03.dats] *)
