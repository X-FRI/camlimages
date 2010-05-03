(***********************************************************************)
(*                                                                     *)
(*                           Objective Caml                            *)
(*                                                                     *)
(*            Fran�ois Pessaux, projet Cristal, INRIA Rocquencourt     *)
(*            Pierre Weis, projet Cristal, INRIA Rocquencourt          *)
(*            Jun Furuse, projet Cristal, INRIA Rocquencourt           *)
(*                                                                     *)
(*  Copyright 1999-2004,                                               *)
(*  Institut National de Recherche en Informatique et en Automatique.  *)
(*  Distributed only by permission.                                    *)
(*                                                                     *)
(***********************************************************************)

(* $Id: oXimage2.mli,v 1.1 2007/01/18 10:29:57 rousse Exp $*)

open Ximage2;;

class ximage : Ximage2.t -> object
  method width : int
  method height : int
  method unsafe_get : int -> int -> Ximage2.elt
  method unsafe_set : int -> int -> Ximage2.elt -> unit
  method get : int -> int -> Ximage2.elt
  method set : int -> int -> Ximage2.elt -> unit
  method data : Gdk.image
  method destroy : unit
end;;

val create :
  kind:Gdk.Image.image_type -> visual:Gdk.visual ->
    width: int -> height: int -> ximage;;
val get_image : [>`drawable] Gobject.obj ->
  x:int -> y:int -> width:int -> height:int -> ximage;;
val of_image :
  Gdk.visual -> (float -> unit) option -> OImages.oimage -> ximage;;

val mask_of_image : Gdk.window -> OImages.oimage -> Gdk.bitmap option;;

val pixmap_of_image :
  Gdk.window -> (float -> unit) option -> OImages.oimage -> GDraw.pixmap;;
