C_LIBS:=-ldl -lm -lasmrun
OCAML_C_FILES:=`ocamlc -where`

#!/bin/sh

fib.o:
	ocamlopt -output-obj -o fib.o fib.ml 

main.o: 
	gcc -c main.c -o main.o -I$(OCAML_C_FILES)

main: fib.o main.o
	gcc fib.o main.o -L$(OCAML_C_FILES) $(C_LIBS) -o main

.PHONY: clean
clean:
	rm -f main *.o *.cmi *.cmx 
