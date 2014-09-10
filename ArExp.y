%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(const char *s) { printf ("Error: %s\n", s); }
%}

%union Data {
	float val;
}

%token <val> NUM
%token MAS MENOS POR ENTRE ENTER

%type <val> exp goal term fact

%%

input:	goal ENTER
		;
goal:	exp					{$$=$1; printf("%f\n", $$); return 0}
		;
exp:	term MAS exp		{$$=$1 + $3;}
		|
		term MENOS exp		{$$=$1 - $3;}
		|
		term				{$$=$1;}
		;
term:	fact POR term		{$$=$1 * $3;}
		|
		fact ENTRE term	{$$=$1 / $3;}
		|
		fact				{$$=$1;}
		;
fact:	NUM					{$$=$1;}
		;

%%

int main() {
	while(1)
	{
		printf(">> ");
		yyparse();
	}
	return 0;
}