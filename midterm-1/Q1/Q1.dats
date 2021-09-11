(*
//
** Midterm
//
** Course: BU CAS CS520
//
** Out: noon on the 28th of October
** Due: 11:59pm on the 28th of October
//
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
// HX: 10 points
//
(*
//
Given an infinite stream xss of infinite streams,
please implement stream_enumerate to enumerate *all*
the elements of the streams contained in xss.
//
Note that a valid solution should contain a brief
argument that explains clearly why all the elements
are eventually enumerated.
//
*)
extern
fun
{a:t@ype}
stream_enumerate(xss: stream(stream(a))): stream(a)
//
(* ****** ****** *)

(* end of [Q1.dats] *)
