# Bortoli Gianluca, n° 159993

LEX = lex
YACC = yacc -d
CC = gcc -std=c99

interpreter: y.tab.o lex.yy.o myClac.o execute.o functional.o
	$(CC) -o interpreter y.tab.o lex.yy.o myClac.o execute.o functional.o -ll -lm

myClac.o: myClac.c

execute.o: execute.c

functional.o: functional.c

lex.yy.o: lex.yy.c y.tab.h

y.tab.c y.tab.h: yacc.y
	$(YACC) -v yacc.y

lex.yy.c: lex.l
	$(LEX) lex.l

clean:
	-rm -f *.o lex.yy.c *.tab.* interpreter *.output