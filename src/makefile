compile:
	flex ArExp.l
	bison -dv ArExp.y -o ArExp_parser.c
	flex ArExp.l
	gcc ArExp_scanner.c ArExp_parser.c -o practica2

clean: 
	rm ArExp_parser.c ArExp_parser.h ArExp_scanner.c ArExp_parser.output practica2
	
run:
	./practica2
