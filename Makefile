C_LIBS:=-ldl -lm -lasmrun
OCAML_C_FILES:=-L`ocamlc -where`

#!/bin/sh

fib.o:
	ocamlopt -output-obj -o fib.o fib.ml 

main.o: 
	gcc -c main.c -o main.o -I`ocamlc -where`

main: fib.o main.o
	gcc fib.o main.o $(OCAML_C_FILES) $(C_LIBS) -o main

.PHONY: clean
clean:
	rm -f main *.o *.cmi *.cmx 
