(* ****** ****** *)

absprop PTRUE
absprop PFALSE

(* ****** ****** *)

propdef T = PTRUE
propdef F = PFALSE

extern
praxi true_intr(): PTRUE
extern
praxi false_elim{A:prop}(pf: PFALSE): A

(* ****** ****** *)
//
absprop PNEG(A: prop) // for negation
propdef ~(A: prop) = PNEG(A) // shorthand
//
extern
praxi neg_intr{A:prop}(fpf: A -> PFALSE): ~A
extern
praxi neg_elim{A:prop}(pf1: ~A, pf2: A): PFALSE
//
prfn
neg_elim2
{A:prop}{B:prop}
(pf1: A, pf2: ~A): B = false_elim(neg_elim(pf2, pf1))
//
(* ****** ****** *)
//
absprop
PCONJ(A: prop, B: prop)
propdef &&(A: prop, B: prop) = PCONJ(A, B) // shorthand
//
extern
praxi
conj_intr
{A,B:prop}(pf1: A, pf2: B): A && B
//
extern
praxi
conj_elim_l{A,B:prop} : (A && B) -> A
extern
praxi
conj_elim_r{A,B:prop} : (A && B) -> B
//
(* ****** ****** *)
//
prfn
conj_commute
{A,B:prop}(pf: A && B): B && A =
conj_intr(conj_elim_r(pf), conj_elim_l(pf))
//
(* ****** ****** *)
//
dataprop
PDISJ(A: prop, B: prop) =
| disj_intr_l(A, B) of (A)
| disj_intr_r(A, B) of (B)
//
propdef ||(A: prop, B: prop) = PDISJ(A, B)
//
(* ****** ****** *)  
//
prfn
disj_commute
{A,B:prop}(pf: A || B): B || A =
case+ pf of
| disj_intr_l(pf_l) => disj_intr_r(pf_l)
| disj_intr_r(pf_r) => disj_intr_l(pf_r)
//
(* ****** ****** *)
//
prfn
disj_elim{A,B:prop}{C:prop}
(pf0: A || B, fpf1: A -> C, fpf2: B -> C): C =
case+ pf0 of
| disj_intr_l(pf0_l) => fpf1(pf0_l)
| disj_intr_r(pf0_r) => fpf2(pf0_r)
//
(* ****** ****** *)

(*
"Intuitionistic" propositional logic // constructive logic
*)

(* ****** ****** *)

extern
prfun
DeMorgan1{A,B:prop}(pf: ~(A||B)): ~A && ~B

primplmnt
DeMorgan1{A,B}(pf0) =
conj_intr
(
neg_intr(lam (pf: A) => neg_elim(pf0, disj_intr_l(pf)))
,
neg_intr(lam (pf: B) => neg_elim(pf0, disj_intr_r(pf)))
)

(* ****** ****** *)

extern
prfun LEM{A:prop}(): A || ~A
extern
prfun DNEG{A:prop}(pf: ~(~A)): A

(* ****** ****** *)

primplmnt
LEM{A}() =
DNEG
(
neg_intr
(
lam
(pf: ~(A || ~A)) =>
let
//
val pf2 =
DeMorgan1(pf) : ~A && ~(~A )
//
val pf21 = conj_elim_l(pf2) : ~A
val pf22 = conj_elim_r(pf2) : ~(~A)
in
  neg_elim(pf22, pf21) : PFALSE
end
)
)

(* ****** ****** *)

primplmnt
DNEG{A}(pf0) =
let
val pf1 = LEM{A}() // pf1: A || ~A
in
case+ pf1 of
| disj_intr_l(pf: A) => pf
| disj_intr_r(pf: ~A) => neg_elim2(pf, pf0)
end

(* ****** ****** *)

(* end of [LEM.dats] *)
