all:
	bison -d ArExp.y
	flex ArExp.l
	gcc practica2.c -o practica2

clean: 
	rm ArExp.tab.c ArExp.tab.h practica2.c practica2
