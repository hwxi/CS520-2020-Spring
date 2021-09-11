(* ****** ****** *)

(*
** Assign01
** It is due Thursday, the 6th of February, 2020
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./prop-logic.sats"

(* ****** ****** *)

(*
** HX: 10 points
*)
extern
prfun
conj_associate2
  {A,B,C:prop}
  (pf: A && (B && C)): (A && B) && C
// end of [conj_assocaite2]

(* ****** ****** *)
      
(*
** HX: 10 points
*)
extern
prfun
disj_associate2
  {A,B,C:prop}
  (pf: A || (B || C)): (A || B) || C
// end of [disj_associate2]
            
(* ****** ****** *)
//
// HX: 10 points
//
extern
prfun
DistLaw_conjdisj
  {A,B,C:prop}
  (pf: A && (B || C)): (A && B) || (A && C)
// end of [DistLaw_conjdisj]
                
(* ****** ****** *)
//
// HX: 10 points
//
extern
prfun
deMorgan_disj{A,B:prop}(pf: ~(A || B)): ~A && ~B
//
(* ****** ****** *)
//
// HX: 10 points
//
extern
prfun
deMorgan_conj{A,B:prop}(pf: ~(A && B)): ~A || ~B
//                `
(* ****** ****** *)

(* end of [assign01.dats] *)
