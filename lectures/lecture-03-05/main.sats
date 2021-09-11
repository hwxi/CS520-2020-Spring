(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share\
/atspre_staload_libats_ML.hats"

(* ****** ****** *)

abstype word = ptr

(* ****** ****** *)

fun
print_word(word): void
fun
fprint_word(FILEref, word): void

(* ****** ****** *)

fun
word2string: word -> string
fun
string2word: string -> word

(* ****** ****** *)

fun
word_listize: word -> list0(char)
fun
word_unlistize: list0(char) -> word

(* ****** ****** *)

(* end of [main.sats] *)
