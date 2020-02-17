#include <stdio.h>

// These are OCaml C Runtime Files https://github.com/ocaml/ocaml/tree/trunk/runtime/caml
#include <caml/alloc.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/callback.h>


int main(int v, char *argv[])
{
  // Have to call the OCaml main function - it initialises the OCaml Runtime environment 
  // https://github.com/ocaml/ocaml/blob/22b1df80c4b326ca1cde199e566fd2b7874073df/runtime/startup_byt.c#L336
  caml_main(argv);
  int n = 10;

  // Values in OCaml (long ints) - Val_int is a macro for (n << 1) + 1
  value caml_int = Val_int(n);
  // The name needs to be the same as the Callback.register <name> from the fib.ml
  value *caml_func = caml_named_value("caml_fib");
  // Returns a value... remember, everthings a value!
  value result = caml_callback(*caml_func, caml_int);
  // Print the OCaml data representation and the "true" value
  printf("OCaml Answer: %li\nReal Answer: %li\n", result, (result - 1) >> 1);
  return 0;
}