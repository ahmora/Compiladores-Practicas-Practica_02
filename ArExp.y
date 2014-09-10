%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(const char *s) { printf ("Error: %s\n", s); }
%}

%union Data {
	float val;
	//char t;
}

%token <val> NUM
%token <t> MAS MENOS POR ENTRE

%type <val> exp goal term fact

%%

goal:	exp					{$$=$1;};
exp:	term MAS exp		{$$=$1 + $3;printf("val: %f\n", $$)}
		|term MENOS exp		{$$=$1 - $3;}
		|term				{$$=$1;};
term:	fact POR term		{$$=$1 * $3;}
		|fact ENTRE term	{$$=$1 / $3;}
		|fact				{$$=$1;};
fact:	NUM					{$$=$1;printf("val: %f\n", $$)};

%%

int main() {
	printf(">> ");
	yyparse();
	return 0;
}