all:
	bison -d ArExp.y
	flex ArExp.l
	gcc practica2.c ArExp.tab.c -o practica2
	./practica2
clean: 
	rm ArExp.tab.c ArExp.tab.h ArExp.c ArExp.h practica2.c practica2
	bison -d ArExp.y
	flex ArExp.l
	gcc practica2.c ArExp.tab.c -o practica2
	./practica2