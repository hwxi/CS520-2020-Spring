(*
//
** Midterm
//
** Course: BU CAS CS520
//
** Out: the 15th of April
** Due: 11:59pm on the 19th of April
*)

(* ****** ****** *)
//
datatype
mylist(a:t@ype+, int) =
//
| mylist_nil(a, 0) of ()
//
| {n:pos}
  mylist_cons0(a, n+n) of (mylist(a, n), mylist(a, n))
| {n:nat}
  mylist_cons1(a, n+n+1) of (a, mylist(a, n), mylist(a, n))
//
(* ****** ****** *)
//
// HX: 10 points
// [mylist_cons] is O(log(n))-time
//
extern
fun
{a:t@ype}
mylist_cons{n:nat}
  (x: a, xs: mylist(INV(a), n)): mylist(a, n+1)
//
(* ****** ****** *)
//
// HX: 10 points
// [mylist_uncons] is O(log(n))-time
//
extern
fun
{a:t@ype}
mylist_uncons
  {n:pos}(xs: mylist(INV(a), n)): (a, mylist(a, n-1))
//
(* ****** ****** *)
//
// You implementation should satisfy the following
// property:
//
//   mylist_uncons(mylist_cons(x, xs)) = (x, xs)
//
(* ****** ****** *)
//
// HX:
// You may use the following implemented function
// templates for testing
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list2mylist{n:nat}(xs: list(INV(a), n)): mylist(a, n)
//
implement
{a}(*tmp*)
list2mylist(xs) =
(
case+ xs of
| list_nil() => mylist_nil()
| list_cons(x, xs) => mylist_cons(x, list2mylist(xs))
)
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist2list{n:nat}(xs: mylist(INV(a), n)): list(a, n)
//
implement
{a}(*tmp*)
mylist2list(xs) =
(
case+ xs of
| mylist_nil() => list_nil()
| _(*non-empty*) =>> let
    val (x, xs) = mylist_uncons(xs) in list_cons(x, mylist2list(xs))
  end // end of [mylist2list]
)
(* ****** ****** *)

(* end of [Q5.dats] *)

