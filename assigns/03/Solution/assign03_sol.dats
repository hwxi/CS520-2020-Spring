(* ****** ****** *)

#include "./../assign03.dats"

(* ****** ****** *)
(*
Please implement isAVL2
*)
(* ****** ****** *)

implement
{a:t@ype}
isAVL2(t0) =
let
//
exception NOTAVL of ()
//
fun
isBalanced(t: tree(a)): int =
case+ t of
|tree_nil() => 0
|
tree_cons(tl, _, tr) =>
let
val left_height = isBalanced(tl)
val right_height = isBalanced(tr)
in
if
abs(left_height - right_height) > 1
then $raise NOTAVL()
else
max(left_height, right_height) + 1
end
//
in
  try
  let
  val _ =
  isBalanced(t0) in true
  end
  with ~NOTAVL() => false
end

(* ****** ****** *)

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
(*
val () = assertloc(isAVL1(t0))
*)
val () =
assertloc(isAVL2(t0))
//
val () = println!("Testing of isAVL2 passed!")
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [assign03_sol.dats] *)
