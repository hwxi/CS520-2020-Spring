(*
dataprop
EQINT
(int, int) =
{x:int} EQINT(x, x) of ()
*)

dataprop
SUM(int, int) =
| SUM0(0, 0) of ()
| {n:nat}{r:int}
  SUM1(n+1, r+n+1) of SUM(n, r)

prfun
SUM_lemma
{n:nat}{r:int}
.<n>.
(
pf: SUM(n, r)
) : EQINT(n*(n+1), 2*r) =
sif
(n==0)
then
let
val+
SUM0() = pf
in
  EQINT() // the base case where n == 0
end
else
let
val+
SUM1(pf1) = pf
val
EQINT() = SUM_lemma(pf1) // induction hypothesis
in
   EQINT()
end

(* ****** ****** *)

(* end of [SUM.dats] *)
