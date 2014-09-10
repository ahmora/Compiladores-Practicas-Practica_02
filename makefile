all:
	bison -dv ArExp.y -o ArExp.c
	flex ArExp.l
	gcc practica2.c ArExp.c -o practica2

clean: 
	rm ArExp.tab.c ArExp.tab.h ArExp.c practica2.c practica2

old:
	bison -d ArExp.y
	flex ArExp.l
	gcc practica2.c -o practica2
