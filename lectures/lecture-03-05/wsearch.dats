(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share\
/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#staload "./main.sats"

(* ****** ****** *)

extern fun wsearch(word): bool

(* ****** ****** *)

local

typedef
key = string and itm = int

in (* in-of-local *)

#include "libats/ML/HATS/myhashtblref.hats"

end // end of [local]

(* ****** ****** *)

local

val
opt =
fileref_open_opt
(
 "/usr/share/dict/words", file_mode_r
) (* end of [val] *)
val-~Some_vt(filr) = opt
//
val
theWords =
myhashtbl_make_nil(128*1024)
//
val ws =
  streamize_fileref_line(filr)
val () =
(
  ws
).foreach()
  (lam w =>theWords.insert_any(w, 0))
//
(*
val ((*void*)) =
  println!
  ("theWords.size() = ", theWords.size())
*)
//
in (* in-of-local *)

implement
wsearch(w0) =
(
let
val w0 = word2string(w0)
in
case+
theWords.search(w0) of
  | ~Some_vt _ => true | ~None_vt _ => false
end // end of [let]
)

end // end of [local]

(* ****** ****** *)

(* end of [wsearch.dats] *)
