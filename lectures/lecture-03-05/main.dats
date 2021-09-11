(* ****** ****** *)
(*
HX-2020-03-06:
How to test:
./main_dats
How to compile:
myatscc main.dats
*)
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

#staload "./main.sats"

(* ****** ****** *)

local

absimpl word = string

in

implement
word2string(w0) = w0
implement
string2word(w0) = w0

implement
word_listize(w0) = string_explode(w0)
implement
word_unlistize(w0) = string_implode(w0)

end // end of [local]

(* ****** ****** *)

#include "./permute.dats"
#include "./wsearch.dats"

(* ****** ****** *)

extern
fun
mygame(word): stream_vt(word)

implement
mygame(given) =
let
val
givens =
streamize_list0_elt
(wpermute(given))
val
answers =
(
stream_vt_filter(givens)
) where
{
implement
stream_vt_filter$pred<word>(w) = $effmask_all(wsearch(w))
}
in
  answers
end // end of [mygame]

(* ****** ****** *)

implement
fprint_word(out, w0) =
fprint!(out, word2string(w0))
implement
fprint_val<word> = fprint_word

(* ****** ****** *)

implement main0() =
{
  val
  answers =
  mygame(string2word("listen"))
  val () =
  stream_vt_fprint(answers, stdout_ref, 100)
  val () = fprintln!(stdout_ref)
}

(* ****** ****** *)

(* end of [main.dats] *)
