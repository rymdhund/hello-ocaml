type greeting = Hello of string [@@ deriving show, eq]

let hello () =
  let x = Hello "world" in
  show_greeting x
