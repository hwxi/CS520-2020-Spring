(* ****** ****** *)
//
#include "./../assign01.dats"
//
(* ****** ****** *)
(*
Please
implement yours proofs below:
*)
(* ****** ****** *)

primplmnt
conj_associate2
  (pf) = (
//
conj_intr
  (conj_intr(pf.l(), (pf.r()).l()), (pf.r()).r())
//
) (* end of [conj_associate2] *)

(* ****** ****** *)

primplmnt
disj_associate2
  (pf) = (
//
case+ pf of
| PDISJ_inj_l(pfA) =>
    PDISJ_inj_l(PDISJ_inj_l(pfA))
| PDISJ_inj_r(pfBC) =>
  (
    case+ pfBC of
    | PDISJ_inj_l(pfB) =>
        PDISJ_inj_l(PDISJ_inj_r(pfB))
    | PDISJ_inj_r(pfC) => PDISJ_inj_r(pfC)
  )
) (* end of [disj_associate2] *)

(* ****** ****** *)

primplmnt
DistLaw_conjdisj
  (pf) = let
//
val pfA = pf.l()
val pfBC = pf.r()
//
in
//
case+ pfBC of
| PDISJ_inj_l(pfB) => PDISJ_inj_l(conj_intr(pfA, pfB))
| PDISJ_inj_r(pfC) => PDISJ_inj_r(conj_intr(pfA, pfC))
//
end // end of [DistLaw_conjdisj]

(* ****** ****** *)

primplmnt
deMorgan_disj{A,B}(pf) = let
//
val pfNA =
neg_intr(lam pfA => neg_elim(pf, PDISJ_inj_l(pfA)))
val pfNB =
neg_intr(lam pfB => neg_elim(pf, PDISJ_inj_r(pfB)))
//
in
  conj_intr(pfNA, pfNB)
end // end of [deMorgan]

(* ****** ****** *)

primplmnt
deMorgan_conj
  {A,B}(pf) = let
//
prval pf0 = LEM{A}()
//
in
//
case+ pf0 of
| PDISJ_inj_l(pfA) =>
    PDISJ_inj_r(neg_intr(lam pfB => neg_elim(pf, conj_intr(pfA, pfB))))
| PDISJ_inj_r(pfNA) => PDISJ_inj_l(pfNA)
//
end // end of [deMorgan_conj]

(* ****** ****** *)

(* end of [assign01_sol.dats] *)
