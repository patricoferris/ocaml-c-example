(* Simple Fibonacci Function *)
let rec fib n = if n = 0 || n = 1 then 1 else fib (n - 1) + fib (n - 2)

let () =
  (*  Register a name that C can get a handle on using caml_named_value(n). *)
  Callback.register "caml_fib" fib