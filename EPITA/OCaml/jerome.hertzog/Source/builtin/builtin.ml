(* Tweaking OCaml builtin euclidean division

The OCaml built-in euclidian divisions operations do not follow the
standard mathematical conventions. We adapt OCaml available
primitives to suit maths conventions. *)

let sign x = if x>=0 then 1 else -1;;

(* Quotient of an integer by a natural number.
    This is the quotient in euclidiant division sense.
    @param a dividend
    @param b natural number you divide by. *)


let quot x y =
  let v = sign (y) * (y) and x1 = sign (x) * (x) in
  let rec quot_rec y = match y with
      y when y>x1 -> 0
    | y -> 1+quot_rec(y+v)
  in let res = quot_rec (v) in match (x,y) with
                               | (x,y) when x<0 && y<0 -> res
                               | (x,y) when y<0 -> -1*res
                               | (x,y) when x<0 && y>0 ->
                                  let ecart = x + (v * res) in (-1*res)+ecart
                               | (x,y) -> res ;;

let modulo x y = x-y*quot x y;;

let div x y = (quot x y,modulo x y);;

(* Quotient of two integers. Fully Recursive.
    General case ; explicit by-hand computations. Not efficient enough as
    it is not a low level implementation. *)

(* Modulo of two integers.
    Following euclidean division NOT OCAML DEFAULT. Positive integer
    between 0 (included) and modulo (excluded) resulting from euclidian
    division of entry by modulo.

    OCAML DEFAULT : For negative numbers eucldean result - modulo base.

    @param a input integer
    @param b moduli integer. *)

(* Division of an integer by a natural number. NOT OCAML DEFAULT.
    Division of an integer by a non-zero integer b is the unique couple
    of integers (q, r) such that a = b*q + r and r is in [0, abs b[.
    @param a dividend
    @param b integer you divide by. *)


