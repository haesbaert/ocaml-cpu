(*
 * Copyright (c) 2022 Christiano Haesbaert <haesbaert@haesbaert.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *)

type kind =
  | P_core
  | E_core

type t =
  { id : int
  ; kind : kind
  ; smt : int
  ; core : int
  ; socket : int
  }

let id t = t.id

let from_smt smt l = List.filter (fun cpu -> cpu.smt = smt) l

let from_core core l = List.filter (fun cpu -> cpu.core = core) l

let from_socket socket l = List.filter (fun cpu -> cpu.socket = socket) l

let dump t =
  let s = match t.kind with P_core -> "P_core" | E_core -> "E_core" in
  Printf.printf "cpu%d: smt=%d core=%d socket=%d kind=%s\n%!" t.id t.smt t.core
    t.socket s

let make ~kind ~id ~smt ~core ~socket = { id; kind; smt; core; socket }
