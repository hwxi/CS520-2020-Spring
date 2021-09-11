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

staload "./prop-logic.sats"

(* ****** ****** *)
//
// 10 points
//
extern
prfun
Contrapos{A,B,C:prop}
  (pf: PIMPL(A, B)): PIMPL(PIMPL(B, C), PIMPL(A, C))
//
(* ****** ****** *)
//
// 05 points
//
extern
prfun
Konstant{A,B:prop}(pf: A): PIMPL(B, A)
//
// 10 points
//
extern
prfun
Substitute{A,B,C:prop}
  (pf: PIMPL(A, PIMPL(B, C))): PIMPL(PIMPL(A, B), PIMPL(A, C))
//
(* ****** ****** *)

(* end of [Q2.dats] *)



