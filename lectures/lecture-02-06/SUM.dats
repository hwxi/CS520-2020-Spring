
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
) : [n*(n+1) == 2*r] void =

sif
(n==0)
then
(
(*
case+ pf of
| SUM0() => () // base case
*)
let
val+ SUM0() = pf in () // base case
end
)
else
(
let
val+
SUM1(pf1) = pf
val () = SUM_lemma(pf1) in ()
end
)